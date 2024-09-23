# Gunter

Gunter is a simple gem to create project using templates inspired by degit.

## Installation

Install gem using gem command:

```bash
gem install gunter
```

## Usage

**Create a new project**

To create a new project using a template, run the following command:

```bash
gunter init <template> <project_name>

# Example
gunter init dvinciguerra/rubygem-cli-template metagunter
```

**List available templates**

All used templates are stored in the `~/.gunter/templates.yml` directory. To list all available templates, run the following command:

```bash
gunter list

# or search by name
gunter search <template_name>
```

**Show information about a template**

To show information about a template, run the following command:

```bash
gunter show <template_name>
```


**Add a new template**

To add a new template, run the following command:

```bash
gunter add <template_url> <template_name>
```

**Remove a template**

To remove a template, run the following command:

```bash
gunter remove <template_name>
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/dvinciguerra/gunter. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/dvinciguerra/gunter/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Gunter project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/dvinciguerra/gunter/blob/main/CODE_OF_CONDUCT.md).

## Author 

Daniel Vinciguerra

