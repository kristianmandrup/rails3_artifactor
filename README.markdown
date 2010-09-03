# Rails3 Artifact helper

Helpers for handling Rails 3 artifacts in general, such as CRUD operations etc

## Install

(pending)
<code>gem install rails3_artifact_helper</code>

## Status

Needs a few days of work/refactoring. Was extracted from rails3_assist project.

## Usage

Introduces the ability to easily load one or more artifact helper modules into your class or module of choice.
This will introduce various helper methods geared toward operating a that particular kind of artifact, such as CRUD operations etc.

<pre>
module MyCoolModule  
  use_artifact_helpers :model, :controller
  use_orm :mongoid
  
  def make_hello_model  
    # this is a method available after loading the :model artifact helper
    # since orm used is set to :mongoid, it will create a mongoid model file
    create_model :hello 
  end
end
</pre>

## TODO

Make full specs suite pass!

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
