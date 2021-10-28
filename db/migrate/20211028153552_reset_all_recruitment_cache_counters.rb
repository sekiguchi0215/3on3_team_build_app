class ResetAllRecruitmentCacheCounters < ActiveRecord::Migration[6.1]
  def up
    Recruitment.find_each { |recruitment| Recruitment.reset_counters(recruitment.id, :entries_count) }
  end
end
