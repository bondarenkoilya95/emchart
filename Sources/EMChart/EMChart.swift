import UIKit

public class EMChart: UIView {
    
    private var xInfoBar: XInfoBar!
    
    private var yInfoBar: YInfoBar!
    
    private var netView: NetView!
    
    // MARK: - Init methods
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureChart()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        configureChart()
    }
    
    // MARK: - Configure View
    
    private func configureChart() {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        configureNetView()
        
        configureXInfoBar()
        configureYInfoBar()
    }
    
    // MARK: - Create X Info Bar
    
    private func configureNetView() {
        netView = NetView(frame: CGRect(x: 0, y: 0, width: self.frame.width - 50, height: self.frame.height - 24))
        netView.translatesAutoresizingMaskIntoConstraints = false
        
        netView.backgroundColor = .yellow
        
        self.addSubview(netView)
        
        let top = NSLayoutConstraint(item: netView!, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 6)
        let left = NSLayoutConstraint(item: netView!, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 0)
        
        NSLayoutConstraint.activate([top, left])
    }
    
    private func configureXInfoBar() {
        xInfoBar = XInfoBar(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 40))
        xInfoBar.translatesAutoresizingMaskIntoConstraints = false
        
        xInfoBar.backgroundColor = .red
        
        self.addSubview(xInfoBar)
        
        let top = NSLayoutConstraint(item: xInfoBar!, attribute: .top, relatedBy: .equal, toItem: netView!, attribute: .bottom, multiplier: 1, constant: 0)
        let left = NSLayoutConstraint(item: xInfoBar!, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 0)
        let bottom = NSLayoutConstraint(item: xInfoBar!, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0)
        let height = NSLayoutConstraint(item: xInfoBar!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 22)
        
        NSLayoutConstraint.activate([top, left, bottom, height])
    }
    
    private func configureYInfoBar() {
        yInfoBar = YInfoBar(frame: CGRect(x: 0, y: 0, width: 50, height: self.frame.height))
        yInfoBar.translatesAutoresizingMaskIntoConstraints = false
        
        yInfoBar.backgroundColor = .brown
        
        self.addSubview(yInfoBar)
        
        let top = NSLayoutConstraint(item: yInfoBar!, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0)
        let left = NSLayoutConstraint(item: yInfoBar!, attribute: .leading, relatedBy: .equal, toItem: netView, attribute: .trailing, multiplier: 1, constant: 0)
        let right = NSLayoutConstraint(item: yInfoBar!, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: 0)
        let bottom = NSLayoutConstraint(item: yInfoBar!, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0)
        let width = NSLayoutConstraint(item: yInfoBar!, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50)
        let left2 = NSLayoutConstraint(item: yInfoBar!, attribute: .leading, relatedBy: .equal, toItem: xInfoBar, attribute: .trailing, multiplier: 1, constant: 0)
        
        NSLayoutConstraint.activate([top, left, left2, right, bottom, width])
    }
}
