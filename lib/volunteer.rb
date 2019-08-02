class Volunteer
  attr_accessor :name, :project_id
  attr_reader :id

  def initialize(attributes)
    @id = attributes.fetch(:id)
    @name = attributes.fetch(:name)
    @project_id = attributes.fetch(:project_id)
  end

  def self.all
    returned_volunteers = DB.exec("SELECT * FROM volunteer;")
    volunteers = []
    returned_volunteers.each() do |volunteer|
      id = volunteer.fetch("id").to_i
      name = volunteer.fetch("name")
      project_id = volunteer.fetch("project_id").to_i
      volunteers.push(Volunteer.new({:name => name, :project_id => project_id, :id => id}))
    end
    volunteers
  end

  def ==(volunteer_to_compare)
    if volunteer_to_compare != nil
      (self.name() == volunteer_to_compare.name()) && (self.project_id() == volunteer_to_compare.project_id())
    else
      false
    end
  end

  def self.clear
    DB.exec("DELETE FROM volunteer *;")
  end

  def delete
    DB.exec("DELETE FROM volunteer WHERE id = #{@id};")
  end

  def save
    result = DB.exec("INSERT INTO volunteer (name, project_id) VALUES ('#{@name}', #{@project_id}) RETURNING id;")
    @id = result.first().fetch("id").to_i
  end

  def self.find(id)
    volunteer = DB.exec("SELECT * FROM volunteer WHERE id = #{id};").first
    if volunteer
      id = volunteer.fetch("id").to_i
      name = volunteer.fetch("name")
      project_id = volunteer.fetch("project_id").to_i
      Volunteer.new({:name => name, :project_id => project_id, :id => id})
    else
      nil
    end
  end

  def update(name, project_id)
    @name = name
    @project_id = project_id
    DB.exec("UPDATE volunteer SET name = '#{@name}', project_id = #{@project_id} WHERE id = #{@id};")
  end

  def self.find_by_project(pro_id)
    volunteers = []
    returned_volunteers = DB.exec("SELECT * FROM volunteer WHERE project_id = #{pro_id};")
    returned_volunteers.each() do |volunteer|
      id = volunteer.fetch("id").to_i
      name = volunteer.fetch("name")
      volunteers.push(Volunteer.new({:name => name, :project_id => pro_id, :id => id}))
    end
    volunteers
  end

  def project
    Project.find(@project_id)
  end
end
