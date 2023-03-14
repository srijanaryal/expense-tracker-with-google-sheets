import 'package:gsheets/gsheets.dart';

class GoogleSheetsApi {
  static const _credentials = {
    {
      "type": "service_account",
      "project_id": "expense-tracker-380517",
      "private_key_id": "36e1dba15b44f7cc3cc1bca406485c8234fee0b3",
      "private_key":
          "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCsss8RD2yJ+o3v\nHBSqQgEGSZa+W0hfkP+CWd9Vy6wqDm9GJlY6kNp37cJLvvLnVRD5Iz7KsJTlSrSO\nFaMvwVcltnrNK3CVWhioxBpAeJ2AA+34f8ff0WbzmnxAmNx8gwp5UfnN11JiA/GQ\nh4Fp/nmkpUNp841yoWbBXH9KA74vA53PnnD+g2agFKFJFsxP+XfJHJFvfInEDe6Z\nJ+O9FXTf7oZ8ENbfqx8Jan5spzMPvQKUTeXud6NihRaaOTckuqJAlDQVoO2TM4m3\n5eLNzUKIZLw4RjS8vRlaBsGbo4mjG7YG29KsElIH0Gw+8ozdXk1l4+RDyOqwlT+G\nOqiCefIRAgMBAAECggEAMHrTqRDg4cz92iFSZcc4nWi8EfzzEKzWJWQQT3fpATdj\nIlixvSgbxC3w7K2SZ8FYDfBIeMLgUYvKqtZFJKtMSRB0YbMvnCWaJYpDalTRtfWk\ncK2CUQDqOzljZwjiYGuy3YLXMuMew9gikHWRrU0cHc2s4onV69eGToKmUwNA+NY/\nZU0CGU1+meW1zvYIr+N8Mn1t1a4O9FNJGauge6Ahywe1g/cp315a9AiolOP2dOjK\nUnEAFjwi6Lozjq9AzhLLp0bfgxIfXdWDMRhZo47lYEOF7PHD1dT553qUpPFaR8jC\ns+BzItefPgurrIMmEDhhNtV4XblblQQnLRmzE3RJfwKBgQDbpIbW8yeKf1DAx4f4\n4ggBsmzfqwSx2BhZM27KNYHMSqa7yaNTF8ibfwypbDq9dsBj/gxwM1JZEfuLm2Na\nExEihy8ZACOUYVxkSQxso4DGtzbFyHImTGVRKl018TF6AtWtiiR2lqnhB/WWr1as\nghn9wjovbQGt+4BywyoviRhvcwKBgQDJSP8pW15Pa/M9lKiJ496wWAWpzn0GXxMA\nM7k5CxzxxDcprYqJX8i2CEnFpVX9JtbSw8RX5q6w+VLqeW+BZJKlvuluzAYculrE\naN2OaASZm1SErsUYDX5ro3n7jGrLWbz6atHMQwK1SN4hBqyrsLggQYhAis57iPe3\nB8AMei3vawKBgC3stcDl8IOV4UWdssGISVJJg1g1AvNIkra7+VNQYsZbaYdkPsEV\n/Pz+UKBwH8wTs2B08xbWtEYpa2YiZGCmEfQdPezFSasxvEa/u1hPy5JBJrOuGKgH\nWzvgVsL7nnO7egAiHUOqdvS1XFVYbg/91/9mCBJ4gVxmdNIKGpz71l8fAoGAJS5w\nw+j20OD1+6gcQexv1E9OLIHSIn0pe14SlvDwldBTCEXgU2P4JXf+eJ4D9lFYWXKE\nMGCSYGqN4HYyHMrBNBDB+g+CCYh6/9EHLCkWwHEq+Z93FOxZL/TwsYDMsWeQOwnE\nW2D9fRNKxPsApm5sdLjmPFXnsnYonAy4cxWWqqUCgYBnpuBeRRhyZ3jmB2y5C/Ki\nnq+00mMtX6c5Tu41oFC7CPTjmGUVjtRr56WRucxxro5XxWzzQXKIC0dki2fW+qh2\nz3E491Wluz21E6wGrRslErdpfSjzf+UK2scd8XvU0TBhewotTXW/DFqy72wYHtyM\n3RSBQ2hOViJCDO9E8TcO8w==\n-----END PRIVATE KEY-----\n",
      "client_email":
          "expenese-tracker@expense-tracker-380517.iam.gserviceaccount.com",
      "client_id": "113790127084295668232",
      "auth_uri": "https://accounts.google.com/o/oauth2/auth",
      "token_uri": "https://oauth2.googleapis.com/token",
      "auth_provider_x509_cert_url":
          "https://www.googleapis.com/oauth2/v1/certs",
      "client_x509_cert_url":
          "https://www.googleapis.com/robot/v1/metadata/x509/expenese-tracker%40expense-tracker-380517.iam.gserviceaccount.com"
    }
  };

  //connect to Spereadsheet

  static final _spreadsheetId = '1CSbdiRtCOsTLgEtQsIMCTsu4htVHF9lvD0vlkd83b2o';
  static final _gsheets = GSheets(_credentials);
  static Worksheet? _worksheet;

  //some variables to keep track of

  static int numberOfTransactions = 0;
  static List<List<dynamic>> currentTransactions = [];
  static bool loading = true;

  Future init() async {
    final ss = await _gsheets.spreadsheet(_spreadsheetId);
    _worksheet = ss.worksheetByTitle('Worksheet1');
    countRows();
  }

  static Future countRows() async {
    while ((await _worksheet!.values
            .value(column: 1, row: numberOfTransactions + 1)) !=
        '') {
      numberOfTransactions++;
    }
    loadTransactions();
  }

  static Future loadTransactions() async {
    if (_worksheet == null) return;

    for (int i = 1; i < numberOfTransactions; i++) {
      final String transactionName =
          await _worksheet!.values.value(column: 1, row: i + 1);
      final String transactionAmount =
          await _worksheet!.values.value(column: 2, row: i + 1);
      final String transactionType =
          await _worksheet!.values.value(column: 3, row: i + 1);

      if (currentTransactions.length < numberOfTransactions) {
        currentTransactions
            .add([transactionAmount, transactionName, transactionType]);
      }
    }
    print(currentTransactions);
    loading = false;
  }
}
