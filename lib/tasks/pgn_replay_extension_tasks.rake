namespace :radiant do
  namespace :extensions do
    namespace :pgn_replay do
      
      desc "Runs the migration of the Pgn Replay extension"
      task :migrate => :environment do
        require 'radiant/extension_migrator'
        if ENV["VERSION"]
          PgnReplayExtension.migrator.migrate(ENV["VERSION"].to_i)
        else
          PgnReplayExtension.migrator.migrate
        end
      end
      
      desc "Copies public assets of the Pgn Replay to the instance public/ directory."
      task :update => :environment do
        is_svn_or_dir = proc {|path| path =~ /\.svn/ || File.directory?(path) }
        puts "Copying assets from PgnReplayExtension"
        Dir[PgnReplayExtension.root + "/public/**/*"].reject(&is_svn_or_dir).each do |file|
          path = file.sub(PgnReplayExtension.root, '')
          directory = File.dirname(path)
          mkdir_p RAILS_ROOT + directory, :verbose => false
          cp file, RAILS_ROOT + path, :verbose => false
        end
      end  
    end
  end
end
