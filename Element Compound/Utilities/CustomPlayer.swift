//
//  CustomPlayer.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 7/14/21.
//

import SwiftUI
import AVKit

//MARK: Using Custom Player

//1. Make sure to import AVKit into the view I want to use this

// Put this in code: CustomPlayer(src: "link to video")
    //.frame(width: UIScreen.main.bounds.width, height: 150)

struct CustomPlayer: UIViewControllerRepresentable {
let src: String

func makeUIViewController(context: UIViewControllerRepresentableContext<CustomPlayer>) -> AVPlayerViewController {
  let controller = AVPlayerViewController()
  let player = AVPlayer(url: URL(string: src)!)
  controller.player = player
  return controller
}

func updateUIViewController(_ uiViewController: AVPlayerViewController, context: UIViewControllerRepresentableContext<CustomPlayer>) { }
}
