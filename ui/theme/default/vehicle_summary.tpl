{extends file="$layouts_admin"}

{block name="content"}

    <div class="row">
        <div class="col-md-12">
            <h4 class="ibilling-page-header">{$_L['Vehicle Summary']} : <a href="#">{$vehicle['vehicle_num']} - {$vehicle['vehicle_type']}</a></h4>
        </div>
    </div>

    <div class="ibox float-e-margins">
        <div class="ibox-content">
            <div class="row">
                <div class="col-md-12">
                    <div class="col-md-3">
                        <a class="dashboard-stat red" href="#">
                            <div class="visual">
                                <i class="fa fa-calculator"></i>
                            </div>
                            <div class="details">
                                <div class="number">
                                    <span class="amount" data-a-sign="{if $vehicle['currency_symbol'] eq ''} {$config['currency_code']} {else} {$vehicle['currency_symbol']}{/if}">{$total_expense_amount}</span>
                                </div>
                                <div class="desc text-right"> {$_L['Total Expense']} </div>
                            </div>
                        </a>
                    </div>
                        
                    <div class="col-md-3">
                        <a class="dashboard-stat blue" href="#">
                            <div class="visual">
                                <i class="fa fa-calculator"></i>
                            </div>
                            <div class="details">
                                <div class="number">
                                    <span class="amount"  data-a-sign="{if $vehicle['currency_symbol'] eq ''} {$config['currency_code']} {else} {$vehicle['currency_symbol']}{/if}">{$income_total}</span>
                                </div>
                                <div class="desc text-right"> {$_L['Total Sales']} </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-3">
                        <a class="dashboard-stat green" href="#">
                            <div class="visual">
                                <i class="fa fa-calculator"></i>
                            </div>
                            <div class="details">
                                <div class="number" {if ($income_total-$total_expense_amount) lt 0 }style="color:red" {/if}>
                                    <span class="amount"  data-a-sign="{if $vehicle['currency_symbol'] eq ''} {$config['currency_code']} {else} {$vehicle['currency_symbol']}{/if}">{$income_total-$total_expense_amount}</span>
                                </div>
                                <div class="desc text-right"> {$_L['Net Profits']} </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-3">
                        <a class="dashboard-stat purple" href="#">
                            <div class="visual">
                                <i class="fa fa-calculator"></i>
                            </div>
                            <div class="details">
                                <div class="number">
                                    <span>{$remain_day}</span>
                                </div>
                                <div class="desc text-right"> {$_L['Remaining Day']} </div>
                            </div>
                        </a>
                    </div>                      
                </div>
            
                <div class="col-md-12">
                    <div class="col-md-6">
                        <img src="{$baseUrl}/storage/items/{$vehicle['v_i']}" alt="" style="width: 100%;">
                    </div>
                    <div class="col-md-6">
                        <table class="table table-bordered">
                            <tr>
                                <td>
                                    <h4 style="margin-left:15px;">{$_L['Vehicle Information']}</h4>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="summary-box">
                                        <table class="table table-bordered table-p-info">
                                            <tr>
                                                <td class="title" width="40%"><span>{$_L['Vehicle No']}</span></td>
                                                <td><a href="#"><span>{$vehicle['vehicle_num']}</span></a></td>
                                            </tr>
                                            <tr>
                                                <td class="title"><span>{$_L['Make s Model']}</span></td>
                                                <td><span>{$vehicle['vehicle_type']}</span></td>
                                            </tr>
                                            <tr>
                                                <td class="title"><span>{$_L['Purchase Price']}</span></td>
                                                <td><span class="amount" data-a-sign="{if $vehicle['currency_symbol'] eq ''} {$config['currency_code']} {else} {$vehicle['currency_symbol']}{/if}">{$vehicle['purchase_price']}</span></td>
                                            </tr>
                                            <tr>
                                                <td class="title"><span>{$_L['PARF Value']}</span></td>
                                                <td><span class="amount" data-a-sign="{if $vehicle['currency_symbol'] eq ''} {$config['currency_code']} {else} {$vehicle['currency_symbol']}{/if}">{$vehicle['parf_cost']}</span></td>
                                            </tr>
                                            <tr>
                                                <td class="title"><span>{$_L['Purchase Date']}</span></td>
                                                <td> <span>{date($config['df'], strtotime($vehicle['purchase_date']))}</span></td>
                                            </tr>
                                            <tr>
                                                <td class="title"><span>{$_L['Scrap Date']}</span></td>
                                                <td><span>{date($config['df'], strtotime($vehicle['expiry_date']))}</span></td>
                                            </tr>
                                            <tr>
                                                <td class="title"><span>{$_L['Expiry Remaining Days']}</span></td>
                                                <td><span>{$expiry_remain_days}</span></td>
                                            </tr>
                                        </table>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>

                <div class="col-md-12">
                    <div class="col-md-6">
                        <table class="table table-bordered">
                            <tr>
                                <td>
                                    <h4 style="margin-left:15px;">{$_L['Total Vehicle Depreciation']}</h4>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="summary-box">
                                        <table class="table table-bordered">
                                            <tr>
                                                <td width="20%" style="border-left-style:hidden; border-top-style:hidden"></td>
                                                <td class="title" style="color:green">{$_L['Total']}</td>
                                                <td class="title" width="20%">{$_L['Daily']}</td>
                                                <td class="title" width="20%">{$_L['Weekly']}</td>
                                                <td class="title" width="20%">{$_L['Monthly']}</td>
                                            </tr>
                                            <tr>
                                                <td class="title" width="20%">{$_L['Vehicle']}</td>
                                                <td class="amount" style="color:green" data-a-sign="{if $vehicle['currency_symbol'] eq ''} {$config['currency_code']} {else} {$vehicle['currency_symbol']}{/if}">{$vehicle_totalcost}</td>
                                                <td class="amount" data-a-sign="{if $vehicle['currency_symbol'] eq ''} {$config['currency_code']} {else} {$vehicle['currency_symbol']}{/if}">{$vehicle_totalcost/$expiry_remain_days}</td>
                                                <td class="amount" data-a-sign="{if $vehicle['currency_symbol'] eq ''} {$config['currency_code']} {else} {$vehicle['currency_symbol']}{/if}">{($vehicle_totalcost/$expiry_remain_days)*7}</td>
                                                <td class="amount" data-a-sign="{if $vehicle['currency_symbol'] eq ''} {$config['currency_code']} {else} {$vehicle['currency_symbol']}{/if}">{($vehicle_totalcost/$expiry_remain_days)*30}</td>
                                            </tr>
                                            <tr>
                                                <td class="title">{$_L['Insurance']}</td>
                                                {if $expense_insurance neq null}
                                                <td class="amount" style="color:green" data-a-sign="{if $vehicle['currency_symbol'] eq ''} {$config['currency_code']} {else} {$vehicle['currency_symbol']}{/if}">{$expense_insurance}</td>
                                                <td class="amount" data-a-sign="{if $vehicle['currency_symbol'] eq ''} {$config['currency_code']} {else} {$vehicle['currency_symbol']}{/if}">{$expense_insurance/$expiry_remain_days}</td>
                                                <td class="amount" data-a-sign="{if $vehicle['currency_symbol'] eq ''} {$config['currency_code']} {else} {$vehicle['currency_symbol']}{/if}">{($expense_insurance/$expiry_remain_days)*7}</td>
                                                <td class="amount" data-a-sign="{if $vehicle['currency_symbol'] eq ''} {$config['currency_code']} {else} {$vehicle['currency_symbol']}{/if}">{($expense_insurance/$expiry_remain_days)*30}</td>
                                                {else}
                                                <td></td><td></td><td></td><td></td>
                                                {/if}
                                            </tr>
                                            <tr>
                                                <td class="title">{$_L['Road Tax']}</td>
                                                 {if $expense_roadtax neq null}
                                                <td class="amount" style="color:green" data-a-sign="{if $vehicle['currency_symbol'] eq ''} {$config['currency_code']} {else} {$vehicle['currency_symbol']}{/if}">{$expense_roadtax}</td>
                                                <td class="amount" data-a-sign="{if $vehicle['currency_symbol'] eq ''} {$config['currency_code']} {else} {$vehicle['currency_symbol']}{/if}">{$expense_roadtax/$expiry_remain_days}</td>
                                                <td class="amount" data-a-sign="{if $vehicle['currency_symbol'] eq ''} {$config['currency_code']} {else} {$vehicle['currency_symbol']}{/if}">{($expense_roadtax/$expiry_remain_days)*7}</td>
                                                <td class="amount" data-a-sign="{if $vehicle['currency_symbol'] eq ''} {$config['currency_code']} {else} {$vehicle['currency_symbol']}{/if}">{($expense_roadtax/$expiry_remain_days)*30}</td>
                                                {else}
                                                <td></td><td></td><td></td><td></td>
                                                {/if}
                                            </tr>
                                            <tr>
                                                <td class="title">{$_L['Loan p Interest']}</td>
                                                 {if $expense_loan neq null}
                                                <td class="amount" style="color:green" data-a-sign="{if $vehicle['currency_symbol'] eq ''} {$config['currency_code']} {else} {$vehicle['currency_symbol']}{/if}">{$expense_loan}</td>
                                                <td class="amount" data-a-sign="{if $vehicle['currency_symbol'] eq ''} {$config['currency_code']} {else} {$vehicle['currency_symbol']}{/if}">{$expense_loan/$expiry_remain_days}</td>
                                                <td class="amount" data-a-sign="{if $vehicle['currency_symbol'] eq ''} {$config['currency_code']} {else} {$vehicle['currency_symbol']}{/if}">{($expense_loan/$expiry_remain_days)*7}</td>
                                                <td class="amount" data-a-sign="{if $vehicle['currency_symbol'] eq ''} {$config['currency_code']} {else} {$vehicle['currency_symbol']}{/if}">{($expense_loan/$expiry_remain_days)*30}</td>
                                                {else}
                                                <td></td><td></td><td></td><td></td>
                                                {/if}
                                            </tr>
                                            <tr>
                                                <td class="title">{$_L['Other Expense']}</td>
                                                 {if $expense_others neq null}
                                                <td class="amount" style="color:green" data-a-sign="{if $vehicle['currency_symbol'] eq ''} {$config['currency_code']} {else} {$vehicle['currency_symbol']}{/if}">{$expense_others}</td>
                                                <td class="amount" data-a-sign="{if $vehicle['currency_symbol'] eq ''} {$config['currency_code']} {else} {$vehicle['currency_symbol']}{/if}">{$expense_others/$expiry_remain_days}</td>
                                                <td class="amount" data-a-sign="{if $vehicle['currency_symbol'] eq ''} {$config['currency_code']} {else} {$vehicle['currency_symbol']}{/if}">{($expense_others/$expiry_remain_days)*7}</td>
                                                <td class="amount" data-a-sign="{if $vehicle['currency_symbol'] eq ''} {$config['currency_code']} {else} {$vehicle['currency_symbol']}{/if}">{($expense_others/$expiry_remain_days)*30}</td>
                                                {else}
                                                <td></td><td></td><td></td><td></td>
                                                {/if}
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="summary-box">
                                        <table class="table table-bordered">
                                            <tr>
                                                <td class="title" width="20%">{$_L['Total']}</td>
                                                <td class="amount" style="font-weight:600; color:green" data-a-sign="{if $vehicle['currency_symbol'] eq ''} {$config['currency_code']} {else} {$vehicle['currency_symbol']}{/if}" width="20%">{$vehicle_total_expense}</td>
                                                <td class="amount" style="font-weight:600" data-a-sign="{if $vehicle['currency_symbol'] eq ''} {$config['currency_code']} {else} {$vehicle['currency_symbol']}{/if}" width="20%">{$vehicle_total_expense/$expiry_remain_days}</td>
                                                <td class="amount" style="font-weight:600" data-a-sign="{if $vehicle['currency_symbol'] eq ''} {$config['currency_code']} {else} {$vehicle['currency_symbol']}{/if}" width="20%">{($vehicle_total_expense/$expiry_remain_days)*7}</td>
                                                <td class="amount" style="font-weight:600" data-a-sign="{if $vehicle['currency_symbol'] eq ''} {$config['currency_code']} {else} {$vehicle['currency_symbol']}{/if}" width="20%">{($vehicle_total_expense/$expiry_remain_days)*30}</td>
                                            </tr>
                                        </table>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="col-md-6">
                        <table class="table table-bordered">
                            <tr>
                                <td>
                                    <h4 style="margin-left:15px;">{$_L['Payment Due']}</h4>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="summary-box">
                                        <table class="table table-bordered">
                                            <tr>
                                                <td width="20%" style="border-left-style:hidden; border-top-style:hidden"></td>
                                                <td class="title" width="25%">{$_L['Due Date']}</td>
                                                <td class="title" width="25%">{$_L['Amount']}</td>
                                                <td class="title" width="15%">{$_L['Status']}</td>
                                                <td class="title" width="15%">{$_L['Manage']}</td>
                                            </tr>
                                            <tr>
                                                <td class="title">{$_L['Road Tax']}</td>
                                                {if $roadtax_id neq ''}
                                                <td {if $roadtax_duestatus neq 0} style="color:#ffa500" {/if}>{date($config['df'], strtotime($roadtax_duedate))}</td>
                                                <td class="amount" data-a-sign="{if $vehicle['currency_symbol'] eq ''} {$config['currency_code']} {else} {$vehicle['currency_symbol']}{/if}">{$roadtax_amount}</td>
                                                <td style="text-align:center;">
                                                     {if $roadtax_paystatus eq 'Paid'}
                                                    <div class="label-success" style="margin:0 auto;width:70px">
                                                        {$roadtax_paystatus}</div>
                                                    {elseif $roadtax_paystatus eq 'unPaid'}
                                                    <div class="label-danger" style="color:#ff2222;margin:0 auto;width:70px">
                                                        {$roadtax_paystatus}</div>
                                                    {else}
                                                    <div class="label-warning" style="border-color:#ffa500;color: #f7931e;margin:0 auto;width:70px;">
                                                        {$roadtax_paystatus}</div>
                                                    {/if}
                                                </td>
                                                <td style="text-align:center;">
                                                    {if $roadtax_paystatus eq "Paid"}
                                                    <a href="#" class="btn btn-xs roadtax_renew" id="{$roadtax_id}" style="background-color:#4B0082; border-color:#4B0082; color:#eeeeee; font-weight: 800" data-toggle="tooltip"
                                                        data-placement="top" title="{$_L['Renew']}">
                                                        {$_L['Renew']}
                                                    </a>
                                                    {else}
                                                    <a href="#" class="btn btn-warning btn-xs roadtax_expense" id="{$roadtax_id}" style="background-color:#FFA500; border-color:#FFA500; color:#eeeeee; font-weight: 800"
                                                        data-toggle="tooltip" data-placement="top" title="{$_L['Add Expense']}">
                                                        &nbsp;+ $&nbsp;
                                                    </a>
                                                    {/if}
                                                </td>
                                                {else}
                                                <td></td><td></td><td></td><td></td>
                                                {/if}
                                            </tr>
                                        </table>
                                    </div>

                                    <div class="summary-box">
                                        <table class="table table-bordered">
                                            <tr>
                                                <td width="20%" style="border-left-style:hidden; border-top-style:hidden"></td>
                                                <td class="title" width="25%">{$_L['Due Date']}</td>
                                                <td class="title" width="25%">{$_L['Amount']}</td>
                                                <td class="title" width="15%">{$_L['Status']}</td>
                                                <td class="title" width="15%">{$_L['Manage']}</td>
                                            </tr>
                                            <tr>
                                                <td class="title">{$_L['Insurance']}</td>
                                                {if $insurance_id neq ''}
                                                <td {if $insurance_duestatus neq 0} style="color:#ffa500" {/if}>{date($config['df'], strtotime($insurance_duedate))}</td>
                                                <td class="amount" data-a-sign="{if $vehicle['currency_symbol'] eq ''} {$config['currency_code']} {else} {$vehicle['currency_symbol']}{/if}">{$insurance_amount}</td>
                                                <td style="text-align:center;">
                                                     {if $insurance_paystatus eq 'Paid'}
                                                    <div class="label-success" style="margin:0 auto;width:70px">
                                                        {$insurance_paystatus}</div>
                                                    {elseif $insurance_paystatus eq 'unPaid'}
                                                    <div class="label-danger" style="color:#ff2222;margin:0 auto;width:70px">
                                                        {$insurance_paystatus}</div>
                                                    {else}
                                                    <div class="label-warning" style="border-color:#ffa500;color: #f7931e;margin:0 auto;width:70px;">
                                                        {$insurance_paystatus}</div>
                                                    {/if}
                                                </td>
                                                <td style="text-align:center;">
                                                     {if $insurance_paystatus eq "Paid"}
                                                    <a href="#" class="btn btn-xs insurance_renew" id="{$insurance_id}" style="background-color:#4B0082; border-color:#4B0082; color:#eeeeee; font-weight: 800" data-toggle="tooltip"
                                                        data-placement="top" title="{$_L['Renew']}">
                                                        {$_L['Renew']}
                                                    </a>
                                                    {else}
                                                    <a href="#" class="btn btn-warning btn-xs insurance_expense" id="{$insurance_id}" style="background-color:#FFA500; border-color:#FFA500; color:#eeeeee; font-weight: 800"
                                                        data-toggle="tooltip" data-placement="top" title="{$_L['Add Expense']}">
                                                         &nbsp;+ $&nbsp;
                                                    </a>
                                                    {/if}
                                                </td>
                                                 {else}
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                {/if}
                                            </tr>
                                        </table>
                                    </div>

                                    <div class="summary-box">
                                        <table class="table table-bordered">
                                            <tr>
                                                <td width="20%" style="border-left-style:hidden; border-top-style:hidden"></td>
                                                <td class="title" width="25%">{$_L['Due Date']}</td>
                                                <td class="title" width="25%">{$_L['Amount']}</td>
                                                <td class="title" width="15%">{$_L['Status']}</td>
                                                <td class="title" width="15%">{$_L['Manage']}</td>
                                            </tr>
                                            <tr>
                                                <td class="title">{$_L['Loan Repay']}</td>
                                                {if $loan_id neq ''}
                                                <td class="date" {if $loan_duestatus neq 0} style="color:#ffa500" {/if}>{date($config['df'], strtotime($loan_duedate))}</td>
                                                <td class="amount" data-a-sign="{if $vehicle['currency_symbol'] eq ''} {$config['currency_code']} {else} {$vehicle['currency_symbol']}{/if}">{$loan_amount}</td>
                                                <td style="text-align:center;">
                                                     {if $loan_paystatus eq 'Paid'}
                                                    <div class="label-success" style="margin:0 auto;width:70px">
                                                        {$loan_paystatus}</div>
                                                    {elseif $loan_paystatus eq 'unPaid'}
                                                    <div class="label-danger" style="color:#ff2222;margin:0 auto;width:70px">
                                                        {$loan_paystatus}</div>
                                                    {else}
                                                    <div class="label-warning" style="border-color:#ffa500;color: #f7931e;margin:0 auto;width:70px;">
                                                        {$loan_paystatus}</div>
                                                    {/if}
                                                </td>
                                                <td style="text-align:center;">
                                                    {if $loan_paystatus eq "Paid" && $renew_status eq "renew"}
                                                    <a href="#" class="btn btn-xs loan_renew" id="{$loan_id}" style="background-color:#4B0082; border-color:#4B0082; color:#eeeeee;font-weight: 800"
                                                        data-toggle="tooltip" data-placement="top" title="{$_L['Renew']}">
                                                        {$_L['Renew']}
                                                    </a>
                                                    {else}
                                                    <a href="#" class="btn btn-warning btn-xs loan_expense" id="{$loan_id}" style="background-color:#FFA500; border-color:#FFA500; color:#eeeeee;font-weight: 800"
                                                        data-toggle="tooltip" data-placement="top" title="{$_L['Add Expense']}">
                                                        &nbsp;+ $&nbsp;
                                                    </a>
                                                    {/if}
                                                </td>
                                                 {else}
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                {/if}
                                            </tr>
                                        </table>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>

                <div class="col-md-12">
                    <div class="col-md-6">
                        <table class="table table-bordered">
                            <tr>
                                <td>
                                    <div class="div-title">
                                        <h4>{$_L['Recent Vehicle Sales']}</h4>
                                        <a href="#" class="btn btn-primary btn-sm">{$_L['View Vehicle Income']}</a>
                                    </div>
                                </td>

                            </tr>
                            <tr>
                                <td>
                                    <div class="summary-box">
                                        <table class="table table-bordered" style="text-align:center">
                                            <tr>
                                                <td class="title">#</td>
                                                <td class="title">{$_L['Date']}</td>
                                                <td class="title">{$_L['Customer']}</td>
                                                <td class="title">{$_L['Amount']}</td>
                                            </tr>
                                            {foreach $incomes as $income}
                                            <tr>
                                                <td>{$income->id}</td>
                                                <td>{$income->date}</td>
                                                <td>{$customer[$income->id]}</td>
                                                <td class="amount" data-a-sign="{if $vehicle['currency_symbol'] eq ''} {$config['currency_code']} {else} {$vehicle['currency_symbol']}{/if}">{$income->amount}</td>
                                            </tr>
                                            {/foreach}
                                            <tr height="20px"><td colspan="4" style="border-left-style:hidden; border-right-style:hidden"></td></tr>
                                            <tr>
                                                <td colspan="2" style="border-top-style:hidden;border-left-style:hidden; border-bottom-style:hidden"></td>
                                                <td class="title">{$_L['Total']}</td>
                                                <td class="amount" data-a-sign="{if $vehicle['currency_symbol'] eq ''} {$config['currency_code']} {else} {$vehicle['currency_symbol']}{/if}">{$income_total}</td>
                                            </tr>
                                        </table>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="col-md-6">
                        <table class="table table-bordered">
                            <tr>
                                <td>
                                    <div class="div-title">
                                        <h4>{$_L['Recent Vehicle Expense']}</h4>
                                        <a href="#" class="btn btn-primary btn-sm">{$_L['View Vehicle Expense']}</a>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="summary-box">
                                        <table class="table table-bordered" style="text-align:center;">
                                            <tr>
                                                <td class="title">#</td>
                                                <td class="title">{$_L['Date']}</td>
                                                <td class="title">{$_L['Category']}</td>
                                                <td class="title">{$_L['Amount']}</td>
                                            </tr>
                                            {foreach $recent_expenses as $t}
                                            <tr>
                                                <td>{$t['id']}</td>
                                                <td class="date">{$t['date']}</td>
                                                <td>{$t['category']}</td>
                                                <td class="amount" data-a-sign="{if $vehicle['currency_symbol'] eq ''} {$config['currency_code']} {else} {$vehicle['currency_symbol']}{/if}">{$t['amount']}</td>
                                            </tr>
                                            {/foreach}
                                            <tr height="20px">
                                                <td colspan="4" style="border-left-style:hidden; border-right-style:hidden"></td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" style="border-top-style:hidden; border-left-style:hidden; border-bottom-style:hidden"></td>
                                                <td class="title">{$_L['Total']}</td>
                                                <td class="amount" data-a-sign="{if $vehicle['currency_symbol'] eq ''} {$config['currency_code']} {else} {$vehicle['currency_symbol']}{/if}">{$total_expense_amount}</td>
                                            </tr>
                                        </table>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
{/block}