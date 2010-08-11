﻿// <copyright file="ModuleBase.cs" company="Engage Software">
// Engage: Employment - http://www.engagesoftware.com
// Copyright (c) 2004-2010
// by Engage Software ( http://www.engagesoftware.com )
// </copyright>
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED 
// TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL 
// THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF 
// CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER 
// DEALINGS IN THE SOFTWARE.

namespace Engage.Dnn.Employment
{
#if TRIAL
    using System;
    using System.Web.UI;

    using Engage.Licensing;
#endif
    
    /// <summary>
    /// Base class for all controls in this module
    /// </summary>
    public class ModuleBase : Framework.ModuleBase
    {
        /// <summary>
        /// Gets the the desktop module name of this module.
        /// </summary>
        /// <value>The name of the desktop module.</value>
        public override string DesktopModuleName
        {
            get { return EmploymentController.DesktopModuleName; }
        }

        /// <summary>
        /// Gets the job group which this module instance is set to display/edit.
        /// </summary>
        /// <value>This instance's Job Group ID</value>
        protected int? JobGroupId
        {
            get
            {
                return ModuleSettings.JobGroupId.GetValueAsInt32For(this);
            }
        }

#if TRIAL
        /// <summary>
        /// Raises the <see cref="Control.Init"/> event.
        /// </summary>
        /// <param name="e">An <see cref="EventArgs"/> object that contains the event data.</param>
        protected override void OnInit(EventArgs e)
        {
            this.LicenseProvider = new TrialLicenseProvider(EmploymentController.ModuleLicenseKey);

            base.OnInit(e);
        }
#endif
    }
}