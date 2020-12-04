# API

## Get list of products

```http
GET /products
```

### Response

```json
[
  {
    "id": 1,
    "name": "Name",
    "tagline": "Tagline",
    "description": "Description",
    "desktop_image": "https://url1",
    "tablet_image": "https://url2",
    "mobile_image": "https://url3"
  }
]
```

### Statuses

| Status Code | Description |
| :--- | :--- |
| 200 | `OK` |
| 500 | `INTERNAL SERVER ERROR` |

## Get current cart

```http
GET /cart
```
### Response

```json
[
  {
    "product_id": 1,
    "quantity": 2
  }
]
```

### Statuses

| Status Code | Description |
| :--- | :--- |
| 200 | `OK` |
| 500 | `INTERNAL SERVER ERROR` |

## Add product to the cart

```http
POST /cart/add
```

| Parameter | Type | Description |
| :--- | :--- | :--- |
| `product_id` | `integer` | **Required**. Product ID |
| `quantity` | `integer` | **Required**. Amount to add |

### Response

```json
[
  {
    "product_id": 1,
    "quantity": 2
  }
]
```

| Status Code | Description |
| :--- | :--- |
| 200 | `OK` |
| 404 | `NOT FOUND` |
| 500 | `INTERNAL SERVER ERROR` |


## Delete product from the cart

```http
POST /cart/delete
```

| Parameter | Type | Description |
| :--- | :--- | :--- |
| `product_id` | `integer` | **Required**. Product ID |

### Response

```json
[
  {
    "product_id": 1,
    "quantity": 2
  }
]
```

| Status Code | Description |
| :--- | :--- |
| 200 | `OK` |
| 404 | `NOT FOUND` |
| 500 | `INTERNAL SERVER ERROR` |

## Update product in the cart

```http
POST /cart/update
```

| Parameter | Type | Description |
| :--- | :--- | :--- |
| `product_id` | `integer` | **Required**. Product ID |
| `quantity` | `integer` | **Required**. New amount |

### Response

```json
[
  {
    "product_id": 1,
    "quantity": 2
  }
]
```

| Status Code | Description |
| :--- | :--- |
| 200 | `OK` |
| 422 | `UNPROCESSABLE ENTITY` |
| 404 | `NOT FOUND` |
| 500 | `INTERNAL SERVER ERROR` |