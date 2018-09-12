# .bash_profile

# Get the aliases and functions
[ -f $HOME/.bashrc ] && . $HOME/.bashrc

function expand() {
  names="$@"
  echo $names
}

function compileKt() {
  files="$@"
  echo "Compiling....."
  kotlinc $files -include-runtime -d output.jar
  echo "Done!"
}    

function foo() {
  echo "Here's a list of functions I made: "
  echo "1) compileKt() - takes a space separated word list of kotlin files and compiles them to jar file on the same dir."
  echo "Done"
}
