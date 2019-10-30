module EmailReportable
  def send_report
    puts "Sending email..."
    # code to actually send email
    puts "Email sent!"
  end

  def receive_report
    puts "Do something"
  end
end

class Employee
  attr_reader :first_name, :last_name, :active
  attr_writer :active

  def initialize(input_options)
    @first_name = input_options[:first_name]
    @last_name = input_options[:last_name]
    @salary = input_options[:salary]
    @active = input_options[:active]
  end

  def print_info
    puts "#{@first_name} #{@last_name} makes #{@salary} a year."
  end

  def give_annual_raise
    @salary = 1.05 * @salary
  end
end

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

class Intern < Employee
  include EmailReportable
end

employee1 = Employee.new({ first_name: "Majora", last_name: "Carter", salary: 80000, active: true })
employee2 = Employee.new(first_name: "Danilo", last_name: "Campos", salary: 70000, active: true)
employee1.print_info
employee2.print_info

manager = Manager.new(
  first_name: "Saron",
  last_name: "Yitbarek",
  salary: 100000,
  active: true,
  employees: [employee1, employee2],
)
manager.print_info
manager.send_report
manager.give_all_raises
p manager

intern = Intern.new(first_name: "Adrienne", last_name: "Lowe", salary: 50000, active: true)
intern.print_info
intern.send_report
