
import UIKit

class CustomNavBar: UIView {
    
    lazy var categoryTitle: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        l.textColor = .white
        l.textAlignment = .center
        return l
    }()
    
    lazy var cardTitle: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        l.textColor = .white
        l.textAlignment = .center
        return l
    }()
    
    lazy var featureLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textAlignment = .center
        return l
    }()
    
    lazy var cardImage: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        return img
    }()
    
    lazy var overlayView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .black.withAlphaComponent(0.7)
        return v
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupViews()
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        self.addSubview(self.cardImage)
        self.addSubview(self.overlayView)
        self.addSubview(self.categoryTitle)
        self.addSubview(self.cardTitle)
        self.addSubview(self.featureLabel)
    }
    
    private func setupConstraints(){
        self.cardImage.pin(to: self)
        self.overlayView.pin(to: self)
        
        NSLayoutConstraint.activate([
            self.categoryTitle.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 5),
            self.categoryTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.categoryTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            self.cardTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 20),
            self.cardTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -20),
            self.cardTitle.topAnchor.constraint(equalTo: self.categoryTitle.bottomAnchor,constant: 5),
            
            self.featureLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 20),
            self.featureLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -20),
            self.featureLabel.topAnchor.constraint(equalTo: self.cardTitle.bottomAnchor,constant: 5)
        ])
    }
    
    public func setupView(data: CardViewModel){
        self.cardTitle.text = data.cardTitle
        self.categoryTitle.text = data.categoryName
        self.cardImage.image = UIImage(named: data.cardImage ?? "")
        self.featureLabel.attributedText = .featureText(data.likeCount ?? "", data.duration ?? "")
    }
    
}
