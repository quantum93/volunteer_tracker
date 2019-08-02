class Project
  attr_accessor :title
  attr_reader :id

  def initialize(attributes)
    @id = attributes.fetch(:id)
    @title = attributes.fetch(:title)
  end

  def self.all
    returned_projects = DB.exec('SELECT * FROM project;')
    projects = []
    returned_projects.each do |project|
      title = project.fetch("title")
      id = project.fetch("id").to_i
      projects.push(Project.new(:title => title, :id => id))
    end
    projects
  end

  def ==(project_to_compare)
    self.title == project_to_compare.title
  end

  def self.find(id)
    project = DB.exec("SELECT * FROM project WHERE id = #{id};").first
    title = project.fetch("title")
    id = project.fetch("id")
    Project.new({:title => title, :id => id})
  end

  def save
    result = DB.exec("INSERT INTO project (title) VALUES ('#{@title}') RETURNING id;")
    @id = result.first().fetch("id").to_i
  end

  def update(title)
    @title = title
    DB.exec("UPDATE project SET title = '#{@title}' WHERE id = #{@id};")
  end

  def delete
    DB.exec("DELETE FROM project WHERE id = #{@id};")
    DB.exec("DELETE FROM volunteer WHERE project_id = #{@id};")
  end

  def volunteers
    Volunteer.find_by_project(self.id)
  end

end
