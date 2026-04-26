# novayagazeta
web-api for novayagazeta.eu / novayagazeta.ru Говорим как есть. Пишем о происходящем в России, Украине и Европе. Новости, аналитика, мнения экспертов, специальные репортажи и журналистские расследования.
# main
```swift
import Foundation
import novayagazeta
let client = Novayagazeta()

do {
    let slugs = try await client.get_slugs_list(eu: false,slugs: ["2026/04/24/daleko-idushchie-vyvody-nalichnykh"])
    print(slugs)
} catch {
    print("Error: \(error)")
}
```

# Launch (your script)
```
swift run
```
