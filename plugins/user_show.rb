module UserPlugin
  class UserShow < Chef::Knife
    banner 'knife user show [USERNAME]'

    def run
      if name_args.length < 1
        show_usage
        ui.fatal("You must specify a username.")
        exit 1
      end
      username = name_args[0]
      api_endpoint = "users/#{username}"
      user = rest.get_rest(api_endpoint)
      ui.output(user)
    end
  end
end
