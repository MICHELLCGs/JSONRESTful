//
//  viewControllerBuscar.swift
//  JSONRESTful
//
//  Created by Michell Condori on 10/06/24.
//

import UIKit

class viewControllerBuscar: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return peliculas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for:
        indexPath)
        cell.textLabel?.text = "\(peliculas[indexPath.row].nombre)"
        cell.detailTextLabel?.text = "Genero:\(peliculas[indexPath.row].genero) Duracion:\(peliculas[indexPath.row].duracion)"
        return cell
    }
    
    
    var peliculas = [Peliculas]()
    
    @IBOutlet weak var txtBuscar: UITextField!
    
    @IBOutlet weak var tablaPeliculas: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tablaPeliculas.delegate = self
        tablaPeliculas.dataSource = self
        
        let ruta = "http://localhost:3000/peliculas/"
        cargarPeliculas(ruta: ruta){
            self.tablaPeliculas.reloadData()
        }
    }
    
    
    @IBAction func btnBuscar(_ sender: Any) {
    }
    func cargarPeliculas(ruta:String, completed:@escaping () -> ()){
        let url = URL(string: ruta)
        URLSession.shared.dataTask(with: url!) {(data, response, error) in
            if error == nil{
                do{
                    self.peliculas = try JSONDecoder().decode([Peliculas].self, from:data!)
                    DispatchQueue.main.async {
                        completed()
                    }
                }catch{
                    print("Error en JSON")
                }
            }
        }.resume()
    }
}
