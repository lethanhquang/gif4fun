GrapeApiary.config do |config|
  # your apiary.io host name
  config.host               = 'http://docs.gif4fun.apiary.io/'
  # the name of your api
  config.name               = 'Gif4Fun'
  # a description for your api
  config.description        = 'Gif4Fun API.'
  # the type to use for generated sample id's (`integer` or `uuid`)
  config.example_id_type    = :integer
  # resources you do not want documented
  config.resource_exclusion = [:admin, :swagger_doc]
  # whether or not examples should include a root element (default: false)
  # config.include_root       = true
end

# request headers you want documented
GrapeApiary.config.request_headers = [
  { 'Accept-Charset' => 'utf-8' }
]

# # response headers you want documented
# GrapeApiary.config.response_headers = [
#   { 'Content-Length' => '21685' },
#   { 'Connection'     => 'keep-alive' }
# ]

