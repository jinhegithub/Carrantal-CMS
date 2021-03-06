{extends file="$layouts_client"}


{block name="content"}

<div class="row">
    <div class="col-md-12">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
               <h5>{$_L['Vehicle No']}  {$val['vehicle_num']}</h5>
            </div>

            <div class="ibox-content">
                <table class="table table-bordered table-hover sys_table ">
                    <thead>
                        <tr>
                            <th>{$_L['Date']}</th>
                            <th>{$_L['Expire Date']}</th>
                            <th>{$_L['Duration']}</th>
                            <th>{$_L['Repayment']}</th>
                            <th>{$_L['Deposit Amount']}</th>
                            <th>{$_L['First Deposit Amount']}</th>
                            <th>{$_L['Total Balance Due']}</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>{$val['date']}</td>
                            <td>{$val['expire_date']}</td>
                            <td>{$val['duration']}</td>
                            <td>{$val['repayment']}</td>
                            <td class="amount" data-value="{$val['amount']}" autocomplete="off" data-a-sign="{$config['currency_code']} " data-a-dec="{$config['dec_point']}" data-a-sep="{$config['thousands_sep']}"                             
                            data-d-group="2">{$val['amount']}</td>
                            <td class="amount" data-value="{$val['first_deposit']}" autocomplete="off" data-a-sign="{$config['currency_code']} " data-a-dec="{$config['dec_point']}" data-a-sep="{$config['thousands_sep']}" 
                            data-d-group="2">{$val['first_deposit']}</td>
                            <td class="amount"  data-value="{$val['total_due']}" autocomplete="off" data-a-sign="{$config['currency_code']} " data-a-dec="{$config['dec_point']}" data-a-sep="{$config['thousands_sep']}"                             
                            data-d-group="2">{$val['total_due']}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <hr>    
            <div class="ibox-content">
                <div>
                    <table class="table table-bordered table-hover sys_table">
                        <thead>
                            <tr>
                                <th colspan="3" width="45%" style="border-top-style:hidden; border-left-style:hidden;background-color:white">&nbsp;</th>
                                <th width="25%">{$_L['First Deposit Amount']}</th>
                                <th width="15%">{$_L['Status']}</th>
                                <th width="15%">{$_L['Manage']}</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td colspan="3" style="border-left-style:hidden; border-bottom-style:hidden; border-top-style:hidden;background-color:white"></td>
                                <td class="amount" autocomplete="off" data-a-sign="{$config['currency_code']} " data-a-dec="{$config['dec_point']}" data-a-sep="{$config['thousands_sep']}"
                                data-d-group="2">{$val['first_deposit']}</td>    
                                <td>
                                     {if $first_paystatus eq 'Paid'}
                                    <div class="label-success" style="margin:0 auto;font-size:85%;width:85px">
                                        {$first_paystatus}</div>
                                    {else}
                                    <div class="label-danger" style="color:#ff2222;margin:0 auto;font-size:85%;width:85px">
                                        {$first_paystatus}</div>
                                    {/if}
                                </td>
                                <td>
                                    {if $first_paystatus eq 'Paid'}
                                    <a href="#" class="btn btn-xs" id="{$val['id']}" style="background-color:#A9A9A9; border-color:#A9A9A9; color:#eeeeee" disabled
                                        data-toggle="tooltip" data-placement="top" title="{$_L['View']}">
                                        {$_L['Add Payment']}
                                    </a>
                                    {elseif $first_payinvoice neq ''}
                                    <a href="#" class="btn btn-xs" id="{$val['id']}" style="background-color:#A9A9A9; border-color:#A9A9A9; color:#eeeeee" disabled
                                        data-toggle="tooltip" data-placement="top" title="{$_L['View']}">
                                        {$_L['Add Payment']}
                                    </a>
                                    <a href="#" class="btn btn-danger btn-xs pending" id="{$first_payinvoice}" style="background-color:#FF2222; border-color:#FF2222; color:#eeeeee"
                                        data-toggle="tooltip" data-placement="top" title="{$_L['View']}">
                                        {$_L['Pending']}
                                    </a>
                                    {else}
                                    <a href="#" class="btn btn-warning btn-xs first_payment" id="{$val['first_deposit']}" style="background-color:#FFA500; border-color:#FFA500; color:#eeeeee"
                                        data-toggle="tooltip" data-placement="top" title="{$_L['View']}">
                                        {$_L['Add Payment']}
                                    </a>
                                    {/if}
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div>
                    <table class="table table-bordered table-hover sys_table ">
                        <thead>
                            <tr>
                                <th width="5%">#</th>
                                <th width="15%">{$_L['Next Due Date']}</th>
                                <th width="25%">{$_L['Balance Due']}</th>
                                <th width="25%">{$_L['Deposit Balance Amount']}</th>
                                <th width="15%">{$_L['Status']}</th>
                                <th width="15%">{$_L['Manage']}</th>
                                
                            </tr>
                        </thead>
                        <tbody>

                        {for $i=1 to $val['duration']}
                            <tr>
                                <td>{$i}</td>
                                <td>{$next_duedate[$i]}</td>

                                <td class="amount" autocomplete="off" data-a-sign="{$config['currency_code']} " data-a-dec="{$config['dec_point']}" data-a-sep="{$config['thousands_sep']}"
                                data-d-group="2">{$balance_due[$i]}</td>
                                <td class="amount" autocomplete="off" data-a-sign="{$config['currency_code']} " data-a-dec="{$config['dec_point']}" data-a-sep="{$config['thousands_sep']}"                            
                                data-d-group="2">{$val['balance_amount']}</td>
                                <td>
                                    {if $pay_status_string[$i] eq 'Paid'}
                                    <div class="label-success" style="margin:0 auto;font-size:85%;width:85px">
                                        {$pay_status_string[$i]}</div>
                                    {elseif $pay_status_string[$i] eq 'unPaid'}
                                    <div class="label-danger" style="color:#ff2222;margin:0 auto;font-size:85%;width:85px">
                                        {$pay_status_string[$i]}</div>
                                    {else}
                                    <div class="label-warning" style="border-color:#ffa500;color: #f7931e;margin:0 auto;font-size:85%;width:85px;">
                                        {$pay_status_string[$i]}</div>
                                    {/if}
                                </td>
                                <td class="text-center">
                                    {if $pay_status_string[$i] eq 'Paid'}
                                    <a href="#" class="btn btn-xs" id="{$val['id']}" style="background-color:#A9A9A9; border-color:#A9A9A9; color:#eeeeee" disabled
                                        data-toggle="tooltip" data-placement="top" title="{$_L['View']}">
                                        {$_L['Add Payment']}
                                    </a>
                                    {elseif $invoice_id[$i] neq ''}
                                    <a href="#" class="btn btn-xs" id="{$val['id']}" style="background-color:#A9A9A9; border-color:#A9A9A9; color:#eeeeee" disabled
                                        data-toggle="tooltip" data-placement="top" title="{$_L['View']}">
                                        {$_L['Add Payment']}
                                    </a>
                                    <a href="#" class="btn btn-danger btn-xs pending" id="{$invoice_id[$i]}" style="background-color:#FF2222; border-color:#FF2222; color:#eeeeee"
                                        data-toggle="tooltip" data-placement="top" title="{$_L['View']}">
                                        {$_L['Pending']}
                                    </a>
                                    {else}
                                    <a href="#" class="btn btn-warning btn-xs add_payment" id="{$val['balance_amount']}" style="background-color:#FFA500; border-color:#FFA500; color:#eeeeee"
                                        data-toggle="tooltip" data-placement="top" title="{$_L['View']}">
                                        {$_L['Add Payment']}
                                    </a>
                                    {/if}
                                </td>
                            </tr>

                        {/for}

                            <tr>
                                <td colspan="2" style="border-left-style:hidden;border-bottom-style:hidden;background-color:white">&nbsp;</td>
                                <td style="border-left-style:hidden;border-bottom-style:hidden;background-color: white; font-weight: 600">{$_L['Total']}</td>
                                <td class="amount" autocomplete="off" data-a-sign="{$config['currency_code']} " data-a-dec="{$config['dec_point']}" data-a-sep="{$config['thousands_sep']}"                             
                                data-d-group="2" style="font-weight: 600">{$val['total_due']}</td>
                                <td colspan="2" style="border-right-style:hidden; border-bottom-style:hidden; background-color:white">&nbsp;</td>
                            </tr>


                        </tbody>

                    </table>
                </div>

            </div>

            <div class="ibox-title">
                <h5>{$_L['Recent Deposit Transactions']}</h5>
            </div>
            <div class="ibox-content">
                <table class="table table-bordered table-hover footable">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>{$_L['Date']}</th>
                            <!-- <th>{$_L['Customer']}</th> -->
                            <th>{$_L['Vehicle No']}</th>
                            <th>{$_L['Category']}</th>
                            <th>{$_L['Amount']}</th>
                            <th>{$_L['Description']}</th>
                        </tr>
                    </thead>
                    <tbody>
                        {if $f_d_t}
                            <tr>
                                <td>{$f_d_t['id']}</td>
                                <!-- <td> {date( $config['df'], strtotime($f_d_t['date']))}</td> -->
                                <td>{$f_d_t['date']}</td>
                                <!-- <td>{$f_t_c}</td> -->
                                <td><a href="#">{$f_d_t['vehicle_num']}</a></td>
                                <td>{$f_d_t['category']}</td>
                                <td data-a-sign="{$config['currency_code']} " data-a-dec="{$config['dec_point']}" data-a-sep="{$config['thousands_sep']}"
                                    data-d-group="2">{$f_d_t['amount']}</td>
                                <td>{$f_d_t['description']}</td>
                            </tr>
                        {/if}
                        {foreach $transactions as $t}
                        {if $transactions neq ''}
                        <tr>
                            <td>{$t['id']}</td>
                            <!-- <td> {date( $config['df'], strtotime($t['date']))}</td> -->
                            <td>{$t['date']}</td>
                            <!-- <td>{$transaction_customer[$t['id']]}</td> -->
                            <td><a href="#">{$t['vehicle_num']}</a></td>
                            <td>{$t['category']}</td>
                            <td  data-a-sign="{$config['currency_code']} " data-a-dec="{$config['dec_point']}" data-a-sep="{$config['thousands_sep']}" data-d-group="2">{$t['amount']}</td>
                            <td>{$t['description']}</td>
                        </tr>
                        {else}
                        <tr>
                            <td>&nbsp;</td><td></td><td></td><td></td><td></td><td></td>
                        </tr>
                        {/if}
                        {/foreach}
                    </tbody>
                    <tfoot>
                        <tr>
                            <td style="text-align: left;" colspan="7">
                                <ul class="pagination">
                                </ul>
                            </td>
                        </tr>
                    </tfoot>
                </table>
            </div>


        </div>
    </div>
</div>
<input type="hidden" id="deposit_id" value="{$val['id']}">
{/block}
{block name="script"}
<script>
    $(document).ready(function () {
       
        var _url = $("#_url").val();

        $.fn.modal.defaults.width = '850px';

        var $modal = $('#ajax-modal');

        $('[data-toggle="tooltip"]').tooltip();


        $('.first_payment').on('click', function (e) {

            e.preventDefault();
            var base_url=$('#_url').val();
            var post_amount = this.id;
            var deposit_id=$('#deposit_id').val();
            
            
            $.redirect(base_url + "client/add_payment/"+deposit_id+"/first_deposit", { amount: post_amount});

           
        });

        $('.add_payment').on('click', function (e) {

            
            e.preventDefault();
            var base_url = $('#_url').val();
            var post_amount=this.id;
            var deposit_id=$('#deposit_id').val();

            $.redirect(base_url + "client/add_payment/"+deposit_id, { amount: post_amount });


        });
        
        $('.pending').on('click', function(e){
            e.preventDefault();
            var base_url = $('#_url').val();
            var invoice_id=this.id;
            var deposit_id = $('#deposit_id').val();
            window.location.href=base_url+'client/deposit_invoice/'+invoice_id+'/'+deposit_id;
        })


    });
</script> 
{/block}

