require './lib/volunteer'
require './lib/project'
require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'pg'
also_reload 'lib/**/*.rb'

DB = PG.connect({:dbname => "volunteer_tracker_test"})

get ('/') do
  redirect to('/projects')
end

get ('/projects') do
  @projects = Project.all
  erb(:projects)
end

get ('/projects/new') do
  erb(:new_project)
end

get ('/projects/:id') do
  @project = Project.find(params[:id].to_i)
  erb(:project)
end
#
get ('/projects/:id/edit') do
  @project = Project.find(params[:id].to_i)
  erb(:edit_project)
end

post ('/projects') do
  title = params[:project_title]
  project = Project.new({:title => title, :id => nil})
  project.save
  redirect to('/projects')
end

patch ('/projects/:id') do
  @project = Project.find(params[:id].to_i)
  @project.update(params[:title])
  redirect to('/projects')
end

delete ('/projects/:id') do
  @project = Project.find(params[:id].to_i)
  @project.delete
  redirect to('/projects')
end

get ('/projects/:id/volunteers/:volunteer_id') do
  @volunteer = Volunteer.find(params[:volunteer_id].to_i)
  erb(:volunteer)
end

post ('/projects/:id/volunteers') do
  @project = Project.find(params[:id].to_i)
  volunteer = Volunteer.new({:name => params[:volunteer_name], :project_id => @project.id, :id => nil})
  volunteer.save()
  erb(:project)
end
