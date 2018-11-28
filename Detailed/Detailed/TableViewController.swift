import UIKit

class TableViewController: UITableViewController {
  
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Model.shared.characters.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.reuseIdentifier, for: indexPath) as? TableViewCell else { fatalError("unable to dequeue TableViewCell")}
        let character = Model.shared.characters[indexPath.row]
      cell.swatchView?.image = Model.shared.image(for: character)
        
                return cell
    }
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
}

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            let destination = segue.destination as? DetailViewController,
            let indexPath = tableView.indexPathForSelectedRow
            else { return }
        
        let character = Model.shared.characters[indexPath.row]
        destination.character = character
    }
    
}

