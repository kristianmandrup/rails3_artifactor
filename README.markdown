# Rails3 Artifactor

DSL for operating on various types of Rails 3 application artifacts. The DSL mostly allows performing common CRUD operations etc.
This is particularly useful when creating Rails 3 generators, plugins etc. that perform code checks and mutations of the app.
The artifactor has in part been designed for use with the *please me* tool. (see my github account)

## Install

<code>gem install rails3_artifactor</code>

## Status

* Specs pass
* Still needs some refactoring to tidy it up!

## Usage

Introduces the ability to easily load one or more artifact helper modules into your class or module of choice.
This will introduce various helper methods geared toward operating a that particular kind of artifact, such as CRUD operations etc.

<pre>
module MyCoolModule  
  use_helpers :model, :controller
  use_orm :mongoid
  
  def make_hello_model  
    # this is a method available after loading the :model artifact helper
    # since orm used is set to :mongoid, it will create a mongoid model file
    create_model :hello do
     '# Hello'
    end
    
    remove_model :hello if has_model? :hello
    
    create_controller :hello do
      ...
    end
  end
end
</pre>

## Update, Okt. 5 2010

Now includes a very flexible API for specifying view files etc. See *view_file_spec.rb* for usage examples.

## TODO

Make DSL even better, fx:
<pre>
  with_model :account do |m|
    m.create! do
     '# hello'
    end
    
    m.remove!    
  end
</pre>

## Note on Patches/Pull Requests
 
* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

## Copyright

Copyright (c) 2010 Kristian Mandrup. See LICENSE for details.
