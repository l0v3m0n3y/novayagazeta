# novayagazeta
web-api for novayagazeta.eu / novayagazeta.ru Говорим как есть. Пишем о происходящем в России, Украине и Европе. Новости, аналитика, мнения экспертов, специальные репортажи и журналистские расследования.
# main
```swift
import Foundation
import novayagazeta
let client = Novayagazeta()

do {
    let news = try await client.get_slugs_list(slugs: ["2026/04/24/daleko-idushchie-vyvody-nalichnykh"])
    print(slugs)
} catch {
    print("Error: \(error)")
}
```

# Launch (your script)
```
swift run
```
