import UIKit

class MenuProfileVC: UIViewController {
    
    let viewModal = MenuProfileViewModel()
    var screen: MenuProfileScreen = MenuProfileScreen()
    
    override func loadView() { //referenciar a screen da vc
        self.screen = MenuProfileScreen()
        self.screen.setUpDelegateTableView(delegate: self, dataSource: self)
        self.view = self.screen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModal.delegate(delegate: self)
        self.viewModal.fetch(.request)
    }
}

extension MenuProfileVC: MenuProfileViewModelDelegate {
    func sucess() {
        print("sucess")
    }
    
    func error(_ message: String) {
        print("error \(message)")
    }
}

extension MenuProfileVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    //protocolo -> passamos uma view para ser a section
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = SectionView()
        view.referenceButton.addTarget(self, action: #selector(self.tapSection(_:)), for: .touchUpInside)
        view.referenceButton.tag = section
        view.setUpDescriptionLabel("Teste")
        return view
    }
    
    @objc func tapSection(_ sender: UIButton) {
        print(#function)
    }
}
