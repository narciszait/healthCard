//
//  UIStoryboardSegueFromRight.swift
//  Health Card
//
//  Created by Narcis Zait on 05/04/2018.
//  Copyright © 2018 Narcis Zait. All rights reserved.
//

import UIKit

class UIStoryboardSegueFromRight: UIStoryboardSegue {
    
    override func perform()
    {
        let src = self.source as UIViewController
        let dst = self.destination as UIViewController
        
        src.view.superview?.insertSubview(dst.view, aboveSubview: src.view)
        dst.view.transform = CGAffineTransform(translationX: src.view.frame.size.width, y: 0)
        
        UIView.animate(withDuration: 1.0,
                                   delay: 0.0,
                                   options: UIView.AnimationOptions.curveEaseInOut,
                                   animations: {
                                    dst.view.transform = CGAffineTransform(translationX: 0, y: 0);
                                    let effectView = UIVisualEffectView()
                                    effectView.frame = self.source.view.frame
                                    self.source.view.addSubview(effectView)
                                    
                                    UIView.animate(withDuration: 0.8) {
                                        effectView.effect = UIBlurEffect(style: .dark)
                                    }
        },
                                   completion: { finished in
                                    src.present(dst, animated: false, completion: nil)
        }
        )
    }
}

class UIStoryboardUnwindSegueFromRight: UIStoryboardSegue {
    
    override func perform()
    {
        let src = self.source as UIViewController
        let dst = self.destination as! InitialViewController
        
        src.view.superview?.insertSubview(dst.view, belowSubview: src.view)
        src.view.transform = CGAffineTransform(translationX: 0, y: 0)
        
        UIView.animate(withDuration: 0.25,
                                   delay: 0.0,
                                   options: UIView.AnimationOptions.curveEaseInOut,
                                   animations: {
                                    src.view.transform = CGAffineTransform(translationX: src.view.frame.size.width, y: 0)
                                    },
                                   completion: { finished in
                                    src.dismiss(animated: false, completion: nil)
        }
        )
    }
}
