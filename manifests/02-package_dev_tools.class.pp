
class package_dev_tools
{

  package
  {
    'git-core':
      ensure  => present
  }
  
  package
  {
    'curl':
      ensure  => present
  }

}
