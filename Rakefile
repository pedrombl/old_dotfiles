HOME = File.expand_path("~")
DOTFILES_PATH = "#{HOME}/.dotfiles"

task :install do |t|
  create_symlink("vim/vimrc.vim", ".vimrc")
  create_symlink("vim/solarized.vim", ".vim/colors/solarized.vim")
end

def create_symlink(relative_path, destiation_path)
  absolute_destination = "#{HOME}/#{destiation_path}"
  if File.symlink?(absolute_destination)
    puts "#{destiation_path} already exists"
  else
    symlink("#{DOTFILES_PATH}/#{relative_path}", absolute_destination)
  end
end
