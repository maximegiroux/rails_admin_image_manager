# RailsAdmin_ImageManager
Image manager for RailsAdmin and CKEditor.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'rails_admin_image_manager'
```

Execute:
```bash
$ bundle install
```

Install migrations:
```bash
$ rails rails_admin_image_manager:install:migrations
```

Run migrations:
```bash
$ rails db:migrate SCOPE=rails_admin_image_manager
```

If you need to explicitly specified the Files and Tags sections in RailsAdmin:
```ruby
index do
  only ['RailsAdminImageManager::Tag', 'RailsAdminImageManager::File']
end
```

## Authors
- Mario Bouchard
- Louis-Philippe Dumas

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
