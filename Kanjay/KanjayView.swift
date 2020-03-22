//
//  KanjayView.swift
//  Kanjay
//
//  Created by Andika Banuraga on 27/04/19.
//  Copyright © 2019 Andika Banuraga. All rights reserved.
//

import UIKit

class KanjayView: UIViewController {
    
    var randomKanji : Int = 0
    
    var doneKanjis : [String] = []
    var randomNumbers : [Int] = []
    var kanjis_arr : [String] = []
    
    var kanjiNum : Int = 1
    
    @IBOutlet weak var kanjiImage: UIImageView!

    @IBOutlet weak var labelKanji: UILabel!
    
    @IBOutlet weak var checkButton: UIButton!
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var kanjiNumbers: UILabel!
    
    func getKanjiNames () {
        
        let fileManager = FileManager.default
        let bundleURL = Bundle.main.bundleURL
        let assetURL = bundleURL.appendingPathComponent("Kanjis")
        let contents = try! fileManager.contentsOfDirectory(at: assetURL, includingPropertiesForKeys: [URLResourceKey.nameKey, URLResourceKey.isDirectoryKey], options: .skipsHiddenFiles)

        for item in contents
        {
            kanjis_arr.append(String(item.lastPathComponent.dropLast(4)))
        }
        
        print(kanjis_arr)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        checkButton.applyDesign()
        nextButton.applyDesign()
        
        // Do any additional setup after loading the view.
        labelKanji.isHidden = true
        getKanjiNames()
        newKanji()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func checkKanji(_ sender: Any) {
        labelKanji.isHidden = false
    }
    
    
    @IBAction func changeKanji(_ sender: Any) {
        labelKanji.isHidden = true
        newKanji()
        
    }
    
    @IBAction func backButton(_ sender: Any) {
        
        navigationController?.popToRootViewController(animated: true)
        
    }
    
    func checkKanjiYo(kanji : String){

        labelKanji.text = kanji

    }

    func newKanji(){
        
        kanjiNumbers.text = String(kanjiNum) + " / 106"
        kanjiNum += 1
        print(kanjiNum)
        
        if kanjis_arr.count == randomNumbers.count {
            navigationController?.popToRootViewController(animated: true)
            
        } else {
            randomKanji = Int(arc4random_uniform(105))
            while randomNumbers.contains(randomKanji){
                randomKanji = Int(arc4random_uniform(105))
            }
            
            
            randomNumbers.append(randomKanji)
            print(randomNumbers)
            
            kanjiImage.image = UIImage(named:  kanjis_arr[randomKanji])
            print(kanjis_arr[randomKanji])
            
            checkKanjiYo(kanji: kanjis_arr[randomKanji])
        
            
        }
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        
        newKanji()
        
    }
    
    
    
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

