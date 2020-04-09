require 'pathname'

require File.join(File.dirname(__FILE__), '../../../puppet/provider/windows_securityoptions')

Puppet::Type.type(:so_systemaccess).provide(:so_systemaccess, parent: Puppet::Provider::Windows_SecurityOptions) do
<<<<<<< HEAD
  require Pathname.new(__FILE__).dirname + '../../../puppet_x/securityoptions/secedit_mapping'
  defaultfor :osfamily => :windows
  confine :osfamily => :windows

  commands :secedit => 'secedit.exe'
    attr_so_accessor(:sovalue)


    def write_export_filename
      'soimports'
    end

    def map_option(securityoption)
      res_mapping = PuppetX::Securityoptions::Mappingtables.new.get_mapping(securityoption, 'SystemAccess')
      res_mapping['name']
    end

    def section_name
      'System Access'
    end

    def self.prefetch(resources)
        instances.each do |right|
            resources.select { |title, res|
                res[:name].downcase == right.get(:name).downcase
            }.map { |name, res|
                res.provider = right
            }
        end
    end

    def self.instances
        out_file_path = File.join(Puppet[:vardir], 'sasecurityoptionsoutput.txt').gsub('/', '\\')
        Puppet.debug out_file_path
        # Once the file exists in UTF-8, secedit will also use UTF-8
        File.open(out_file_path, 'w') { |f| f.write('# We want UTF-8') }
        secedit('/export', '/cfg', out_file_path, '/areas', 'securitypolicy')
        return getregistryvalues(out_file_path)
    end

   def self.getregistryvalues(out_file_path)
      ini = Puppet::Util::IniFile.new(out_file_path, '=')
      ini.get_settings('System Access').map { |k, v|
        res_displayname = PuppetX::Securityoptions::Mappingtables.new.get_displayname(k, 'SystemAccess')
        res_mapping     = PuppetX::Securityoptions::Mappingtables.new.get_mapping(res_displayname, 'SystemAccess')

        if res_mapping['data_type'] == "integer" then
          value = v.to_i
        elsif res_mapping['data_type'] == "qstring" then
          value = v
        end


        new({
          :name      => res_displayname,
          :ensure    => :present,
          :sovalue   => value,
        })
      }

   end

end
