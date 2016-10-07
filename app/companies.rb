# encoding: UTF-8

get '/api/all_content_sources' do
  format_response(ContentSources.all, request.accept)
end

get '/api/all_content' do
  format_response(Content.all, request.accept)
end

post '/api/contents' do
  data = JSON.parse request.body.read

  content = Content.create(
    name: data['name'],
    s: data['s'],
    e: data['e'],
    sourceURL: data['sourceURL'],
    contentURL: data['contentURL'],

    created_at: Time.now.utc,
    updated_at: Time.now.utc
  )

  halt 404 if content.id.nil?
  status 200
  format_response(content, request.accept)
end

post '/api/sources' do
  data = JSON.parse request.body.read

  content = ContentSources.create(
    name: data['name'],
    s: data['s'],
    e: data['e'],
    sourceURL: data['sourceURL'],
    contentURL: data['contentURL'],
    fullOrgName: data['fullOrgName'],

    created_at: Time.now.utc,
    updated_at: Time.now.utc
  )

  halt 404 if content.id.nil?
  status 200
  format_response(content, request.accept)
end



















get '/api/files' do
  format_response(Company.all, request.accept)
end

get '/api/start/:id' do
  # check the state
  # if isStarted, then do nothing
  # just send response ..
  
  company ||= Company.get(params[:id]) || halt(404)
    
    # chenge this to rest sevice, to control the selfending by the omxplayer ...
  system('echo -n "q">/tmp/omxcmd &')
  system('rm -f /tmp/omxcmd')
  system("mkfifo /tmp/omxcmd")
#  system("omxplayer -o hdmi /home/pi/Rt/Gra/WtchMp/#{company.name} </tmp/omxcmd & ")
  system("omxplayer -o hdmi #{company.path} </tmp/omxcmd & ")
  system('echo -n "">/tmp/omxcmd')
  # dose an /tmp/omxcmd exist?
  print "Start\n"
  format_response(company, request.accept)
end

get '/api/stop/:id' do
  company ||= Company.get(params[:id]) || halt(404)
  system('echo -n "q">/tmp/omxcmd')
  system('rm /tmp/omxcmd')
  print "Stop\n"
  format_response(company, request.accept)
end

# tak zmieniamy tylko na open i list, ewentualnie mv/change/add/...
get '/api/play/:id' do
  company ||= Company.get(params[:id]) || halt(404)
  system('echo -n "p">/tmp/omxcmd')
  print "Play\n"
  format_response(company, request.accept)
end

get '/api/pause/:id' do
  company ||= Company.get(params[:id]) || halt(404)
  system('echo -n "p">/tmp/omxcmd')
  print "Pause\n"
  format_response(company, request.accept)
end

get '/api/incvolume/:id' do
  company ||= Company.get(params[:id]) || halt(404)
  system('echo -n "+">/tmp/omxcmd')
  print "IncVolume\n"
  format_response(company, request.accept)
end

get '/api/decvolume/:id' do
  company ||= Company.get(params[:id]) || halt(404)
  system('echo -n "-">/tmp/omxcmd')
  print "DecVolume\n"
  format_response(company, request.accept)
end

#get '/api/stop' do
#  system('echo -n "q">/tmp/omxcmd')
#  system('rm /tmp/omxcmd')
#  print "Stop\n"  
#  format_response(Company.all, request.accept)
#end

#Left Arrow  Seek -30 s
#Right Arrow Seek +30 s
#Down Arrow  Seek -600 s
#Up Arrow    Seek +600 s
get '/api/moreB/:id' do
  company ||= Company.get(params[:id]) || halt(404)
  system('echo -n "^[[B">/tmp/omxcmd')
  format_response(company, request.accept)
end
get '/api/lessB/:id' do
  company ||= Company.get(params[:id]) || halt(404)
  system('echo -n "^[[D">/tmp/omxcmd')
  format_response(company, request.accept)
end
get '/api/moreF/:id' do
  company ||= Company.get(params[:id]) || halt(404)
  system('echo -n "^[[A">/tmp/omxcmd')
  format_response(company, request.accept)
end
get '/api/lessF/:id' do
  company ||= Company.get(params[:id]) || halt(404)
  system('echo -n "^[[C">/tmp/omxcmd')
  format_response(company, request.accept)
end












# >>>> remove those and add correct once

# get the company
get '/api/company/:id' do
  company ||= Company.get(params[:id]) || halt(404)
  format_response(company, request.accept)
end

get '/api/changeWatched/:id' do
  company ||= Company.get(params[:id]) || halt(404)
  print "#{company.name}, #{company.id}, #{company.watched} \n"
  halt 500 unless company.update(
    watched: true,
    updated_at: Time.now.utc
  )
  print "#{company.name}, #{company.id}, #{company.watched} \n"
  #format_response(company, request.accept)
  format_response(Company.all, request.accept)
end

get '/preaprePlayable/:id' do
  company ||= Company.get(params[:id]) || halt(404)

  print "#{company.name}, #{company.id}, #{company.watched_counter} \n"

  content_type 'text/html', :charset => 'utf-8'
  "
<div>
  <!-- 3840 x 2160 -->
  Playing: #{company.name}, #{company.id}, #{company.path}
  <video width=\"800\" height=\"600\" controls><source src=\"#{company.path}\" onclick=\"this.play();\">Your browser does not support the video tag.</video>
</div>
  "
  #<video width=\"800\" height=\"600\" controls><source src=\"#{company.path}\" type=\"video/mp4\" onclick=\"this.play();\">Your browser does not support the video tag.</video>
end

get '/api/playable/:id' do
  company ||= Company.get(params[:id]) || halt(404)

  print "#{company.name}, #{company.id}, #{company.watched_counter} \n"

  format_response(company, request.accept)
end


# add the company
post '/api/companies' do
  data = JSON.parse request.body.read
  # check required
  print "#{data['name']}, #{data['watched_counter']},  #{data['got_at']} \n"

  company = Company.create(
    name: data['name'],
    watched_counter: data['watched_counter'],
    path: data['path'],
    se: data['se'],
    fileformat: data['fileformat'],
    #got_at: data['got_at'],
    got_at: Date.strptime(data['got_at'], "%Y-%m-%dT%V:%u:%H"),
    created_at: Time.now.utc,
    updated_at: Time.now.utc
  )

  print "#{data['name']}, #{data['watched_counter']},  #{data['got_at']} (#{company.id}) \n"

  halt 404 if company.id.nil?
  status 201
  format_response(company, request.accept)
end


# update
# change name
# move to
# improve information ..

put '/api/company/:id' do
  data = JSON.parse request.body.read
  company ||= Company.get(params[:id]) || halt(404)
  # check required
  halt 500 unless company.update(
    name: data['name'],
    watched_counter: data['watched_counter'],
    got_at: data['got_at'],
    updated_at: Time.now.utc
  )
  format_response(company, request.accept)
end

# delete the comapany
delete '/api/company/:id' do
  company ||= Company.get(params[:id]) || halt(404)
  halt 500 unless company.destroy
end
## <<<< api server part.








## >>>> ui server part:

get '/h5/js/angular.js' do
  content_type 'application/javascript', :charset => 'utf-8'
  send_file './h5/js/angular.js'
end

get '/h5/js/angular-route.js' do
  content_type 'application/javascript', :charset => 'utf-8'
  send_file './h5/js/angular-route.js'
end

get '/h5/js/app.js' do
  content_type 'application/javascript', :charset => 'utf-8'
  send_file './h5/js/app.js'
end

get '/h5/css/style.css' do
  content_type 'text/css', :charset => 'utf-8'
  send_file './h5/css/style.css'
end

get '/' do
  content_type 'text/html', :charset => 'utf-8'

  headers 'Access-Control-Allow-Origin' => '*'
  headers 'Access-Control-Allow-Headers' => 'Authorization,Accepts,Content-Type,X-CSRF-Token,X-Requested-With,X-HTTP-Method-Override,Cache-Control,Accept'
  headers 'Access-Control-Allow-Methods' => 'HEAD,GET,POST,PUT,DELETE,OPTIONS'

  send_file './h5/html/index.html'
end

get '/h5/html/parts/mainView.html' do
  content_type 'text/html', :charset => 'utf-8'
  send_file './h5/html/parts/mainView.html'
end

get '/h5/html/parts/displayAllView.html' do
  content_type 'text/html', :charset => 'utf-8'
  send_file './h5/html/parts/displayAllView.html'
end

get '/h5/html/parts/addNewCompanyView.html' do
  content_type 'text/html', :charset => 'utf-8'
  send_file './h5/html/parts/addNewCompanyView.html'
end

get '/h5/html/parts/displayCompanyView.html' do
  content_type 'text/html', :charset => 'utf-8'
  send_file './h5/html/parts/displayCompanyView.html'
end

get '/h5/html/parts/editCompanyView.html' do
  content_type 'text/html', :charset => 'utf-8'
  send_file './h5/html/parts/editCompanyView.html'
end

get '/h5/html/parts/play.html' do
  content_type 'text/html', :charset => 'utf-8'
  send_file './h5/html/parts/play.html'
end

#get '/favicon.ico' do
#  #content_type 'text/html', :charset => 'utf-8'
#  send_file '/favicon.ico'
#end




get '/h5/html/parts/playable.html' do
  content_type 'text/html', :charset => 'utf-8'
  send_file './h5/html/parts/playable.html'
end

get '/h5/html/parts/playable.html/:id' do
  data = JSON.parse request.body.read
  company ||= Company.get(params[:id]) || halt(404)

  content_type 'text/html', :charset => 'utf-8'
  '
<div>
        <!-- 3840 x 2160 -->
        Playing:<p></p>{{item.name}}
                <p></p>{{item.id}}
                <p></p>

        <video width="800" height="600" controls><source src="#{company.name}" type="video/mp4">Your browser does not support the video tag.</video>
        <!--<video width="800" height="600" controls><source src="/home/gra/Downloads/The.Principal.S01E01.HDTV.x264-W4F.mp4" type="video/mp4">Your browser does not support the video tag.</video>-->
</div>
  '
end

head '/home/gra/Downloads/*' do |file|
  print "Powinien teraz podać path pliku: (/home/gra/Downloads/#{file})(#{file})\n"
  send_file("/home/gra/Downloads/#{file}")
end

get '/home/gra/Downloads/*' do |file|
  print "Powinien teraz podać path pliku: (/home/gra/Downloads/#{file})(#{file})\n"
  send_file("/home/gra/Downloads/#{file}")
end

