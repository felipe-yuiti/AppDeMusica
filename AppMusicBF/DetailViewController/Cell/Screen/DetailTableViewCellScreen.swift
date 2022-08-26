/
import UIKit

class DetailTableViewCellScreen: UIView {

    lazy var thumbImage: UIImageView = {
        var img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "demo")
        img.layer.cornerRadius = 5
        img.clipsToBounds = true
        return img
    }()
    
    lazy var title: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "Teste Nome"
        l.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        l.textColor = .black
        return l
    }()
    
    lazy var subTitle: UILabel = {
        var l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "Sub Titulo"
        l.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        l.textColor = .lightGray
        return l
    }()
    
    lazy var likeBtn: UIButton = {
        var btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setBackgroundImage(UIImage(named: "love")?.withRenderingMode(.alwaysTemplate), for: .normal)
        btn.tintColor = .lightGray
        return btn
    }()
    
    lazy var moreBtn: UIButton = {
        var btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setBackgroundImage(UIImage(named: "more")?.withRenderingMode(.alwaysTemplate), for: .normal)
        btn.tintColor = .lightGray
        return btn
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
        self.addSubview(self.thumbImage)
        self.addSubview(self.title)
        self.addSubview(self.subTitle)
        self.addSubview(self.likeBtn)
        self.addSubview(self.moreBtn)
    }
    
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            
            self.thumbImage.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 20),
            self.thumbImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.thumbImage.heightAnchor.constraint(equalToConstant: 60),
            self.thumbImage.widthAnchor.constraint(equalToConstant: 60),
            
            self.title.leadingAnchor.constraint(equalTo: self.thumbImage.trailingAnchor,constant: 15),
            self.title.topAnchor.constraint(equalTo: self.topAnchor,constant: 17),
            
            self.subTitle.leadingAnchor.constraint(equalTo: self.thumbImage.trailingAnchor,constant: 15),
            self.subTitle.topAnchor.constraint(equalTo: self.title.bottomAnchor,constant: 4),
            
            self.moreBtn.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -15),
            self.moreBtn.widthAnchor.constraint(equalToConstant: 35),
            self.moreBtn.heightAnchor.constraint(equalToConstant: 35),
            self.moreBtn.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            self.likeBtn.trailingAnchor.constraint(equalTo: self.moreBtn.leadingAnchor,constant: -15),
            self.likeBtn.widthAnchor.constraint(equalToConstant: 35),
            self.likeBtn.heightAnchor.constraint(equalToConstant: 35),
            self.likeBtn.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    public func setupCell(data: CardListModel){
        self.title.text = data.listTitle
        self.subTitle.text = data.listSubtitle
        self.thumbImage.image = UIImage(named: data.listImage ?? "")
    }


}
