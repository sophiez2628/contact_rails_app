require 'addressable/uri'
require 'rest-client'

def create_user
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/contact_shares/',
    # query_values: {
    #   'some_category[a_key]' => 'another value',
    #   'some_category[a_second_key]' => 'yet another value',
    #   'some_category[inner_inner_hash][key]' => 'value',
    #   'something_else' => 'aaahhhhh'
    # }
  ).to_s

  puts RestClient.post(
    url, {contact_share: {user_id: 2, contact_id: 1}}
  )
end

create_user
