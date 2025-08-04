# <span style="color:black">**Лицензирование**</span>
Симплайт 5 — коммерческое программное обеспечение. Компания-разработчик ПО оставляют за собой права на модификацию и распространение системы. Пользователь получает право на ограниченное использование приобретенного экземпляра ПО за определённую плату. 

<style>
  table.compact-table {
    border-collapse: collapse;
    width: 100%;
    font-weight: 300;
    font-size: 0.625rem;
  }

  table.compact-table thead th {
  font-weight: bold;
}

  table.compact-table th,
  table.compact-table td {
    padding: 4px 6px;
    border: 1px solid #ccc;
    line-height: 1.3;
    text-align: center;
    vertical-align: middle;
    font-weight: 300;
  }

  table.compact-table th:first-child {
    text-align: left;
  }

  table.compact-table tbody tr:hover {
    background-color: #f5f5f5;
  }

  @media (max-width: 768px) {
    table.compact-table {
      font-size: 0.75rem;
      display: block;
      overflow-x: auto;
      white-space: nowrap;
    }
  }

  /*------------------------------*/
  @media print {
  table.compact-table {
    font-size: 8px;
    width: 100%;
    table-layout: auto;
    word-wrap: break-word;
  }

  table.compact-table th,
  table.compact-table td {
    word-break: break-word;
    white-space: normal;
    padding: 2px 4px;
  }

  body {
    -webkit-print-color-adjust: exact;
    print-color-adjust: exact;
  }
}


</style>

<table class="compact-table">
  <thead>
    <tr>
      <th></th>
      <th>Free</th>
      <th>Base</th>
      <th>Standard</th>
      <th>Enterprise</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>Максимальное количество тегов</th>
      <td>66</td>
      <td>1000</td>
      <td>10 000</td>
      <td>500 000</td>
    </tr>
    <tr>
      <th>Драйвер протокола</th>
      <td>OPC UA/DA, Modbus Master (TCP/RTU/ASCII)</td>
      <td>OPC UA/DA, Modbus Master (TCP/RTU/ASCII)</td>
      <td>OPC UA/DA, Modbus Master (TCP/RTU/ASCII), MQTT Client</td>
      <td>OPC UA/DA, MODBUS Master (TCP/RTU/ASCII), MQTT Client</td>
    </tr>
    <tr>
      <th>Система хранения данных</th>
      <td>SQLITE</td>
      <td>SQLITE</td>
      <td>SQLITE или PostgreSQL</td>
      <td>PostgreSQL</td>
    </tr>
    <tr>
      <th>Сетевая архитектура</th>
      <td style="background-color:#ffebeb">нет</td>
      <td style="background-color:#ffebeb">нет</td>
      <td style="background-color:#eaffe7">клиент-сервер</td>
      <td style="background-color:#eaffe7">распределенная и клиент-сервер</td>
    </tr>
    <tr>
      <th>Отчеты</th>
      <td style="background-color:#ffebeb">нет</td>
      <td style="background-color:#ffebeb">нет</td>
      <td style="background-color:#eaffe7">да</td>
      <td style="background-color:#eaffe7">да</td>
    </tr>
    <tr>
      <th>Расширенная диагностика</th>
      <td style="background-color:#ffebeb">нет</td>
      <td style="background-color:#ffebeb">нет</td>
      <td style="background-color:#eaffe7">да</td>
      <td style="background-color:#eaffe7">да</td>
    </tr>
    <tr>
      <th>Резервирование серверов</th>
      <td style="background-color:#ffebeb">нет</td>
      <td style="background-color:#ffebeb">нет</td>
      <td style="background-color:#ffebeb">нет</td>
      <td style="background-color:#eaffe7">да</td>
    </tr>
    <tr>
      <th>Интеграция со сторонними системами</th>
      <td style="background-color:#ffebeb">нет</td>
      <td style="background-color:#eaffe7">базовая</td>
      <td style="background-color:#eaffe7">расширенная</td>
      <td style="background-color:#eaffe7">расширенная</td>
    </tr>
    <tr>
      <th>Время работы в режиме исполнения без лицензии</th>
      <td style="background-color:#eaffe7">без ограничений</td>
      <td style="background-color:#ffebeb">1 час</td>
      <td style="background-color:#ffebeb">1 час</td>
      <td style="background-color:#ffebeb">1 час</td>
    </tr>
  </tbody>
</table>

!!! Abstract "Замечание"
    Лицензированию подлежит только **серверная часть** системы Симплайт 5.  
    
    При отсутствии лицензии сервер функционирует в режиме trial mode: не более одного часа непрерывной работы, после чего требуется перезапуск. Во время работы над проектом разработчик должен указать тип приобретенной лицензии. В процессе загрузки проекта на сервер выполняется проверка соответствия лицензии проекта и USB-ключа сервера. Если лицензии не совпадают, то проект может быть не загружен, либо загружен частично. Также, при развертывании проекта, на сервере формируются служебные предупреждения о несоответствии лицензии. 
