cask 'miniconda2' do
  version '4.5.12'
  sha256 'd6d931a970c09cdfc968becbf7d423bdcdcd9d92c622bfc5bd86c69202298bfc'

  # repo.anaconda.com/miniconda was verified as official when first introduced to the cask
  url "https://repo.anaconda.com/miniconda/Miniconda2-#{version}-MacOSX-x86_64.sh"
  name 'Continuum Analytics Miniconda'
  homepage 'https://conda.io/miniconda.html'

  depends_on macos: '>= :lion'
  container type: :naked

  installer script: {
                      executable: "Miniconda2-#{version}-MacOSX-x86_64.sh",
                      args:       ['-b', '-p', "#{HOMEBREW_PREFIX}/miniconda2"],
                      sudo:       true,
                    }

  postflight do
    set_ownership "#{HOMEBREW_PREFIX}/miniconda2"
  end

  uninstall delete: "#{HOMEBREW_PREFIX}/miniconda2"


  zap trash: [
               '~/.condarc',
               '~/.conda',
               '~/.continuum',
             ]

  caveats do
    files_in_usr_local
  end
end
