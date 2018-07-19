require_relative "../config/environment.rb"
require 'active_support/inflector'
require 'pry'
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

  self.column_names.each do |col|
    attr_accessor col.to_sym
  end










end
