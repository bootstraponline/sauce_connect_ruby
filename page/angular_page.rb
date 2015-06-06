module Page
  class AngularPage
    include PageObject

    page_url 'https://angularjs.org/'

    element :download_button, css: 'a[ng-click="showDownloadModal()"]'
  end
end
