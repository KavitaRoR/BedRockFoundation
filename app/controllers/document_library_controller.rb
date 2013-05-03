class DocumentLibraryController < ApplicationController
 skip_before_filter :verify_authenticity_token, :only => ['elfinder','add_files_to_job']

def index
end

  def elfinder
    h, r = ElFinder::Connector.new(
      :root => File.join(Rails.public_path, 'library', 'files'),
      :url => '/library/files',
       :perms => {
         /^(Welcome|README)$/ => {:read => true, :write => true, :rm => false},
         '.' => {:read => true, :write => true, :rm => true}, # '.' is the proper way to specify the home/root directory.
         /^test$/ => {:read => true, :write => true, :rm => false},
         'logo.png' => {:read => true},
         /\.png$/ => {:read => false} # This will cause 'logo.png' to be unreadable.  
                                      # Permissions err on the safe side. Once false, always false.
       },
       :extractors => { 
         'application/zip' => ['unzip', '-qq', '-o'], # Each argument will be shellescaped (also true for archivers)
         'application/x-gzip' => ['tar', '-xzf'],
       },
       :archivers => { 
         'application/zip' => ['.zip', 'zip', '-qr9'], # Note first argument is archive extension
         'application/x-gzip' => ['.tgz', 'tar', '-czf'],
         },

    ).run(params)

    headers.merge!(h)

    render (r.empty? ? {:nothing => true} : {:text => r.to_json}), :layout => false
  end

  def attach_files
  	render layout: 'library'
  end

  def add_files_to_job
  	@job = Job.find( params[:job_id] )
  	job_files = params[:p]
  	job_files.each do |f|
  		@job.library_files.create(
  			library_file: f.last[:name],
  			file_type: f.last[:file_type],
  			file_size: f.last[:file_size],
  			file_url: f.last[:file_url]
  		)
  	end
  	render nothing: true
  end

  def create
  end

  def destroy
  end

  def download_file
  	job_file = LibraryFile.find( params[:id] )
  	send_file( File.join(Rails.public_path, job_file.file_url) )
  end
end
