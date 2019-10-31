require "./employee.rb"
require "./email_reportable.rb"

module Actualize
  class Manager < Employee
    include EmailReportable

    def initialize(input_options)
      super(input_options)
      @employees = input_options[:employees]
    end

    def give_all_raises
      # Manual loop
      # @employees[0].give_annual_raise
      # @employees[1].give_annual_raise

      # While loop
      # index = 0
      # while index < @employees.length
      #   @employees[index].give_annual_raise
      #   index = index + 1
      # end

      # Each loop
      @employees.each do |employee|
        employee.give_annual_raise
      end
    end

    def fire_all_employees
      @employees.each do |employee|
        employee.active = false
      end
    end
  end
end
