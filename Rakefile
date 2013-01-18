def project_file(root_dir='.')
  Find.find(root_dir) do |f|
    if f =~ /\.xcodeproj$/
      return f
    end
  end
  nil
end

def xcodebuild
  "xcodebuild -project #{project_file}"
end

desc 'Build the default target using the default configuration'
task :build do |t|
  puts %x{
    #{xcodebuild} |
    grep -v "note: This view overlaps one of its siblings ."
  }
end

task :default => [ :build ]
