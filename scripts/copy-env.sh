mkdir -pv env/.config

# copy config dirs
for dir in nvim tmux fish; do
  cp -R ~/.config/$dir/ env/.config/$dir
done

# copy config files
cp ~/.tmux.conf env/.tmux.conf
