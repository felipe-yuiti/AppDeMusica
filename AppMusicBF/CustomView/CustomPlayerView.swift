
import UIKit
import MarqueeLabel

class CustomPlayerView: UIView {
    
    var videoTimer: Timer?
    var time:CGFloat = 0.0
    
    lazy var imageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleToFill
        return img
    }()
    
    lazy var marqueeLabel: MarqueeLabel = {
       let l = MarqueeLabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont(name: "Avenir-Heavy", size: 18)
        l.textColor = .white.withAlphaComponent(0.8)
        l.type = .continuous
        l.animationCurve = .linear
        l.fadeLength = 10.0
        l.leadingBuffer = 30.0
        l.trailingBuffer = 30.0
        return l
    }()
    
    lazy var pausePlayBtn: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "pause")?.withRenderingMode(.alwaysTemplate)
        img.tintColor = .white.withAlphaComponent(0.8)
        return img
    }()
    
    lazy var trackBar: UIProgressView = {
        let v = UIProgressView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.progressTintColor = .yellow.withAlphaComponent(0.8)
        v.progress = 0.0
        return v
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .black
        self.setupViews()
        self.setupContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupViews(){
        self.addSubview(self.imageView)
        self.addSubview(self.marqueeLabel)
        self.addSubview(self.pausePlayBtn)
        self.addSubview(self.trackBar)
        
        self.videoTimer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(self.changeTrackBar), userInfo: nil, repeats: true)
        
        
    }
    
    private func setupContraints(){
        NSLayoutConstraint.activate([
            self.imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.imageView.topAnchor.constraint(equalTo: self.topAnchor),
            self.imageView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            self.imageView.widthAnchor.constraint(equalToConstant: 90),
            
            self.marqueeLabel.leadingAnchor.constraint(equalTo: self.imageView.trailingAnchor,constant: 10),
            self.marqueeLabel.trailingAnchor.constraint(equalTo: self.pausePlayBtn.leadingAnchor,constant: -5),
            self.marqueeLabel.topAnchor.constraint(equalTo: self.topAnchor,constant: 32),
            
            self.pausePlayBtn.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.pausePlayBtn.topAnchor.constraint(equalTo: self.topAnchor,constant: 25),
            self.pausePlayBtn.heightAnchor.constraint(equalToConstant: 40),
            self.pausePlayBtn.widthAnchor.constraint(equalToConstant: 40),
            
            self.trackBar.leadingAnchor.constraint(equalTo: self.imageView.trailingAnchor),
            self.trackBar.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.trackBar.topAnchor.constraint(equalTo: self.topAnchor)
        ])
    }
    
    
    @objc func changeTrackBar(){
        self.time += 0.001
        self.trackBar.progress = Float(self.time / 120)
        if self.time >= 120{
            self.videoTimer?.invalidate()
            self.videoTimer = nil
        }
    }
    
    public func setupView(data:CardListModel){
        self.imageView.image = UIImage(named: data.listImage ?? "")
        self.marqueeLabel.text = data.listTitle
        self.time = 0.0
        self.trackBar.progress = 0.0
        self.videoTimer = nil
        self.videoTimer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(self.changeTrackBar), userInfo: nil, repeats: true)
    }
    

}
