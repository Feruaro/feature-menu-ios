import UIKit

class SectionView: UIView {
    
    lazy var descriptionLabel: UILabel = {
       let label = UILabel()
       label.translatesAutoresizingMaskIntoConstraints = false
       label.font = UIFont.systemFont(ofSize: 16)
       return label
    }()
    
    lazy var referenceButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        return button
    }()
    
    lazy var lineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray5
        return view
    }()
    
    lazy var arrowImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .systemPink
        imageView.image = UIImage(systemName: "seta")
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview()
        self.setUpConsraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubview() {
        self.addSubview(descriptionLabel)
        self.addSubview(referenceButton)
        self.addSubview(lineView)
        self.addSubview(arrowImageView)
    }
    
    public func setUpDescriptionLabel(_ description: String) {
        self.descriptionLabel.text = description
        print("\(String(describing: self.descriptionLabel.text))")
    }
    
    public func setUpConsraints() {
        NSLayoutConstraint.activate([
            self.referenceButton.topAnchor.constraint(equalTo: self.topAnchor),
            self.referenceButton.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.referenceButton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.referenceButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            self.arrowImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.arrowImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            
            self.descriptionLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.descriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            
            self.lineView.topAnchor.constraint(equalTo: self.topAnchor),
            self.lineView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.lineView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.lineView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
}
