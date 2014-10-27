module Merit
  class Score < ActiveRecord::Base
    # Meant to display a leaderboard. Accepts options :table_name (users by
    # default), :since_date (1.month.ago by default) and :limit (10 by
    # default).
    #
    # It lists top 10 scored objects in the last month by default.
    #
    # This is a postgresql snippet, you may need to tweak it for other ORMs.
    def self.top_scored(options = {})
      options[:table_name] ||= :users
      options[:since_date] ||= 1.month.ago
      options[:limit]      ||= 10

      alias_id_column = "#{options[:table_name].to_s.singularize}_id"
      if options[:table_name] == :sashes
        sash_id_column = "#{options[:table_name]}.id"
      else
        sash_id_column = "#{options[:table_name]}.sash_id"
      end

      klass = options[:table_name].to_s.classify.constantize
      klass_scope = klass.joins("LEFT JOIN merit_scores ON merit_scores.sash_id = #{sash_id_column}")
      klass_scope = klass_scope.joins("LEFT JOIN merit_score_points ON merit_score_points.score_id = merit_scores.id")
      klass_scope = klass_scope.select("#{options[:table_name]}.id AS #{alias_id_column}, SUM(merit_score_points.num_points) as sum_points")
      klass_scope = klass_scope.where("merit_score_points.created_at > '#{options[:since_date]}'")
      klass_scope = klass_scope.where("users.cohort_id = #{options[:cohort]}") if options[:cohort]
      klass_scope = klass_scope.group("#{options[:table_name]}.id, merit_scores.sash_id")
      klass_scope = klass_scope.order("sum_points DESC")
      klass_scope = klass_scope.limit(options[:limit])


      # MeritableModel - Sash -< Scores -< ScorePoints
#       sql_query = <<SQL
#       SELECT
#         #{options[:table_name]}.id AS #{alias_id_column},
#         SUM(num_points) as sum_points
#       FROM #{options[:table_name]}
#       LEFT JOIN merit_scores ON merit_scores.sash_id = #{sash_id_column}
#       LEFT JOIN merit_score_points ON merit_score_points.score_id = merit_scores.id
#       WHERE
#         users.cohort_id = #{options[:cohort]} AND
#         merit_score_points.created_at > '#{options[:since_date]}'
#       GROUP BY
#         #{options[:table_name]}.id,
#         merit_scores.sash_id
#       ORDER BY sum_points DESC
#       LIMIT #{options[:limit]}
# SQL
      results = ActiveRecord::Base.connection.execute(klass_scope.to_sql)
      results.map do |h|
        h.keep_if { |k, v| (k == alias_id_column) || (k == 'sum_points') }
      end
      results
    end
  end
end
