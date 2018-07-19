require_relative "../config/environment.rb"
require 'active_support/inflector'

class InteractiveRecord

  def self.table_name
    self.to_s.downcase.pluralize
  end

  def self.column_names
    DB[:conn].results_as_hash = true
    sql = <<-SQL
    PRAGMA table_info('#{table_name}')
    SQL
    table_info = DB[:conn].execute(sql)
    columns = []
    table_info.each {|col| columns << col['name']}
    columns.compact
  end

  def initialize(attributes={})
    attributes.each {|k,v| self.send(("#{k}="), v)}
  end










end
