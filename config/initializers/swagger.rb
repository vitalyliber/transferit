GrapeSwaggerRails.options.url      = '/api'
GrapeSwaggerRails.options.app_name = 'Transferit API'

GrapeSwaggerRails.options.before_filter_proc = proc {
  GrapeSwaggerRails.options.app_url = request.protocol + request.host_with_port
}
