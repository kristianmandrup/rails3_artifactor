require 'sugar-high/includes'
require_all File.dirname(__FILE__) + '/crud'

module Rails3::Assist::Artifact::CRUD
  extends_and_includes :create, :read, :update, :delete
end