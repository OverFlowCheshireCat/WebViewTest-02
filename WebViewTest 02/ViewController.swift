import UIKit
import WebKit

class ViewController: UIViewController, UISearchBarDelegate, WKNavigationDelegate {

    @IBOutlet weak var webView: WKWebView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var backBtn: UIBarButtonItem!
    @IBOutlet weak var forwardBtn: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        webView.navigationDelegate = self
        
        let request = URLRequest(url: URL(string: "http://www.naver.com")!)
        
        webView.load(request)
    }
    
    public func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let data = searchBar.text!
        
        let request: URLRequest!
        
        if (data.contains("http://")) {
            request = URLRequest(url: URL(string: data)!)
        } else {
            request = URLRequest(url: URL(string: "http://" + data)!)
        }
        
        webView.load(request)
    }
    
    public func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        backBtn.isEnabled = webView.canGoBack
        forwardBtn.isEnabled = webView.canGoForward
    }
    
    
    public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        backBtn.isEnabled = webView.canGoBack
        forwardBtn.isEnabled = webView.canGoForward
    }
    
    @IBAction func backAction(_ sender: Any) {
        webView.goBack()
    }
    
    @IBAction func forwardAction(_ sender: Any) {
        webView.goForward()
    }
}
