			<div id="footer">
				<div id="footer_left">
					{if isset($USERNAME)}
						<div class="footer_login">
							{if isset($U_PROFILE)}
								<div class="footer_customize">
									[<a href="{$U_PROFILE}" title="{'customize the appareance of the gallery'|@translate}">{$USERNAME}</a>]&nbsp;
								</div>
							{else}
								[{$USERNAME}]&nbsp;
							{/if}
						</div>
					{/if}

					{if isset($U_LOGIN)}
						<a href="{$U_LOGIN}" rel="nofollow">{'Login'|@translate}</a>
					{/if}

					{if (isset($U_LOGIN) && isset($U_REGISTER))}-{/if}
					
					{if isset($U_REGISTER)}
						<a href="{$U_REGISTER}" title="{'Create a new account'|@translate}" rel="nofollow">{'Register'|@translate}</a>
					{/if}

					{if isset($U_LOGOUT)}
						<a href="{$U_LOGOUT}">{'Logout'|@translate}</a>
					{/if}

					{if (isset($U_LOGOUT) && isset($U_ADMIN))}-{/if}

					{if isset($U_ADMIN)}
						<a href="{$U_ADMIN}" title="{'available for administrators only'|@translate}">{'Administration'|@translate}</a>
					{/if}

					{get_combined_scripts load='footer'}

					{if isset($footer_elements)}
						{foreach from=$footer_elements item=v}
							{$v}
						{/foreach}
					{/if}
				</div>
				
				<div id="copyright">
					{*
						Please, do not remove this copyright. If you really want to,
								contact us on http://piwigo.org to find a solution on how
								to show the origin of the script...
					*}
					{'Propelled by'|@translate}
					<a href="{$PHPWG_URL}" class="Piwigo"><span class="Piwigo">Piwigo</span></a>
					{$VERSION}

					{if isset($CONTACT_MAIL)}
						 - {'Contact'|@translate}
						<a href="mailto:{$CONTACT_MAIL}?subject={'A comment on your site'|@translate|@escape:url}">{'Webmaster'|@translate} </a>
					{/if}

					{if isset($TOGGLE_MOBILE_THEME_URL)}
					- {'View in'|@translate} : <a href="{$TOGGLE_MOBILE_THEME_URL}">{'Mobile'|@translate}</a> | <b>{'Desktop'|@translate}</b>
					{/if}

					{if isset($debug.TIME) }
					 - {'Page generated in'|@translate} {$debug.TIME} ({$debug.NB_QUERIES} {'SQL queries in'|@translate} {$debug.SQL_TIME})
					{/if}

				</div>{* copyright *}
			</div>
		</div>{* the_page *}
		{if isset($debug.QUERIES_LIST)}
			<div id="debug">
				{$debug.QUERIES_LIST}
			</div>
		{/if}
	</body>
</html>
