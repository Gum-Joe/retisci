# Index of nodejs engine + methods
###
# Module dependencies
###
{Build} = require '../../../classes/build'
###
# Vars
###
engine = module.exports = {}
###
# Engine class
# @extends build
# @class
###
class Builder extends Build
  start: () ->
    if typeof @options.local != 'undefined' && @options.local == true || @config.hasOwnProperty('local') && @config.local == true
      # body...
      # No need for a bash script
      @logger.info('Running a local build...')
      # Gets globals
      if @config.hasOwnProperty 'global'
        @installGlobals()
      # @script generated by @createScript()
      @createScript()
      # Pre-install cmd
      if @config.hasOwnProperty 'pre_install'
        @pre_install = @config.pre_install
        @logger.deb "Adding pre_install commands..."
        @script.echo("")
        @script.echo("\'Running pre install command(s)...\'".green.bold)
        # Check type
        if typeof @pre_install == 'string'
          @script.add(@config.pre_install)
        else if typeof @pre_install == 'array' || @pre_install.hasOwnProperty 'length'
          for prei in @pre_install
            @script.add(prei)
        else
          @logger.err "Expected pre_install command(s) to be #{"\'string\'".green.bold} or #{"\'array\'".magenta.bold} but got #{"\'#{typeof @pre_install}\'".yellow.bold}!"
          throw new TypeError "Expected pre_install command(s) to be \'string\' or \'array\' but got \'#{typeof @pre_install}\'!"

      # Install cmd
      if @config.hasOwnProperty 'install'
        @install = @config.install
        @logger.deb "Adding install commands..."
        @script.echo("")
        @script.echo("\'Running install command(s)...\'".green.bold)
        # Check type
        if typeof @install == 'string'
          @script.add(@config.install)
        else if typeof @install == 'array' || @install.hasOwnProperty 'length'
          for ins in @install
            @script.add(ins)
        else
          @logger.err "Expected install command(s) to be #{"\'string\'".green.bold} or #{"\'array\'".magenta.bold} but got #{"\'#{typeof @install}\'".yellow.bold}!"
          throw new TypeError "Expected install command(s) to be \'string\' or \'array\' but got \'#{typeof @install}\'!"

      # Post_install cmd
      if @config.hasOwnProperty 'post_install'
        @post_install = @config.post_install
        @logger.deb "Adding post_install commands..."
        @script.echo("")
        @script.echo("\'Running post install command(s)...\'".green.bold)
        # Check type
        if typeof @post_install == 'string'
          @script.add(@config.post_install)
        else if typeof @post_install == 'array' || @post_install.hasOwnProperty 'length'
          for posi in @post_install
            @script.add(posi)
        else
          @logger.err "Expected post_install command(s) to be #{"\'string\'".green.bold} or #{"\'array\'".magenta.bold} but got #{"\'#{typeof @post_install}\'".yellow.bold}!"
          throw new TypeError "Expected post_install command(s) to be \'string\' or \'array\' but got \'#{typeof @post_install}\'!"

      # Pre-build cmd
      if @config.hasOwnProperty 'pre_build'
        @pre_build = @config.pre_build
        @logger.deb "Adding pre_build commands..."
        @script.echo("")
        @script.echo("\'Running pre build command(s)...\'".green.bold)
        # Check type
        if typeof @pre_build == 'string'
          @script.add(@config.pre_build)
        else if typeof @pre_build == 'array' || @pre_build.hasOwnProperty 'length'
          for preb in @pre_build
            @script.add(preb)
        else
          @logger.err "Expected pre_install command(s) to be #{"\'string\'".green.bold} or #{"\'array\'".magenta.bold} but got #{"\'#{typeof @pre_build}\'".yellow.bold}!"
          throw new TypeError "Expected pre_install command(s) to be \'string\' or \'array\' but got \'#{typeof @pre_build}\'!"

      # Build cmd
      if @config.hasOwnProperty 'build'
        @build = @config.build
        @logger.deb "Adding build commands..."
        @script.echo("")
        @script.echo("\'Running build command(s)...\'".green.bold)
        # Check type
        if typeof @build == 'string'
          @script.add(@config.build)
        else if typeof @build == 'array' || @build.hasOwnProperty 'length'
          for bui in @build
            @script.add(bui)
        else
          @logger.err "Expected build command(s) to be #{"\'string\'".green.bold} or #{"\'array\'".magenta.bold} but got #{"\'#{typeof @build}\'".yellow.bold}!"
          throw new TypeError "Expected build command(s) to be \'string\' or \'array\' but got \'#{typeof @build}\'!"

      # Post_build cmd
      if @config.hasOwnProperty 'post_build'
        @post_build = @config.post_build
        @logger.deb "Adding post_build commands..."
        @script.echo("")
        @script.echo("\'Running post build command(s)...\'".green.bold)
        # Check type
        if typeof @post_build == 'string'
          @script.add(@config.post_build)
        else if typeof @post_build == 'array' || @post_build.hasOwnProperty 'length'
          for posb in @post_build
            @script.add(posb)
        else
          @logger.err "Expected post_build command(s) to be #{"\'string\'".green.bold} or #{"\'array\'".magenta.bold} but got #{"\'#{typeof @post_build}\'".yellow.bold}!"
          throw new TypeError "Expected post_build command(s) to be \'string\' or \'array\' but got \'#{typeof @post_build}\'!"

      # Run
      #@script.runScript()
    else
      ###
      # Create bash script
      # @docker only
      ###
      @logger.deb('Generating bash script...')

engine.Builder = Builder
