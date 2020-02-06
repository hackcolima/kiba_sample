require_relative '../../config/environment'
require "sqlite3"

class VariantsSource

  attr_reader :db

  def initialize
    @db = SQLite3::Database.new(Rails.root.join('db/development.sqlite3').to_s)
    @db.results_as_hash = true
  end

  def each
    db.execute("select * from variants") do |row|
      yield(row)
    end
  end
end
