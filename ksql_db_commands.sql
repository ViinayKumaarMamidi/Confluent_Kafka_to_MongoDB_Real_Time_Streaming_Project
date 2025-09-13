-- Orders Stream

CREATE STREAM macd_orders_stream (
    order_id STRING,
    customer_id STRING,
    order_total DOUBLE,
    order_items ARRAY<STRUCT<item_name STRING, quantity INT, price DOUBLE>>,
    order_time TIMESTAMP
) WITH (
  KAFKA_TOPIC = 'macd_orders',
    KEY_FORMAT = 'KAFKA',
    VALUE_FORMAT = 'AVRO',
    TIMESTAMP = 'order_time'
);


-- Payments stream

CREATE STREAM macd_payments_stream (
    payment_id STRING,
    order_id STRING,
    payment_amount DOUBLE,
    payment_method STRING,
    payment_time TIMESTAMP
) WITH (
    KAFKA_TOPIC = 'macd_payments',
    KEY_FORMAT = 'KAFKA',
    VALUE_FORMAT = 'AVRO',
    TIMESTAMP = 'payment_time'
);


-- Join stream

CREATE STREAM macd_orders_payments_joined AS
SELECT 
    o.order_id AS order_id,
    o.customer_id AS customer_id,
    o.order_total AS order_total,
    o.order_items AS order_items,
    o.order_time AS order_time,
    p.payment_id AS payment_id,
    p.payment_amount AS payment_amount,
    p.payment_method AS payment_method,
    p.payment_time AS payment_time
FROM macd_orders_stream o
INNER JOIN macd_payments_stream p
    WITHIN 24 HOURS
    ON o.order_id = p.order_id
EMIT CHANGES;


-- #################################
select * FROM  MACD_ORDERS_STREAM limit 10;

-- Sample Orders 1 row: 

[
  {
    "ORDER_ID": "39216c93-e3d8-47d1-b171-eefd378af8d7",
    "CUSTOMER_ID": "cust_1233",
    "ORDER_TOTAL": 14.58,
    "ORDER_ITEMS": [
      {
        "ITEM_NAME": "Hash Browns",
        "QUANTITY": 4,
        "PRICE": 9.6
      }
    ],
    "ORDER_TIME": "2025-09-01T20:21:39.395",
    "__confluent_index": 9
  }
]


------------------------

select * FROM  MACD_PAYMENTS_STREAM limit 5;

-- SAMPLE PAYMENT 1 Row: 

[
  {
    "PAYMENT_ID": "7a888f32-2897-4131-9be2-5b0b084a72f2",
    "ORDER_ID": "1527c311-828c-4552-95bc-bfdde8db1d19",
    "PAYMENT_AMOUNT": 69.56,
    "PAYMENT_METHOD": "mobile_payment",
    "PAYMENT_TIME": "2025-09-01T08:00:14.883",
    "__confluent_index": 4
  }
]

-- 

select * FROM macd_orders_payments_joined limit 5;

[
  {
    "ORDER_ID": "3a2d45e5-de7a-41cb-9b59-79d67a7e7b95",
    "CUSTOMER_ID": "cust_1692",
    "ORDER_TOTAL": 52.33,
    "ORDER_ITEMS": [
      {
        "ITEM_NAME": "Egg McMuffin",
        "QUANTITY": 4,
        "PRICE": 6.18
      },
      {
        "ITEM_NAME": "French Fries",
        "QUANTITY": 4,
        "PRICE": 5.83
      },
      {
        "ITEM_NAME": "Filet-O-Fish",
        "QUANTITY": 2,
        "PRICE": 9.89
      }
    ],
    "ORDER_TIME": "2025-09-01T17:34:41.996",
    "PAYMENT_ID": "13276274-1656-4444-9300-6e9e076bd817",
    "PAYMENT_AMOUNT": 52.33,
    "PAYMENT_METHOD": "mobile_payment",
    "PAYMENT_TIME": "2025-09-01T17:36:55.240"
  }
]

