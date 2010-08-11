// <copyright file="ApplicationPropertyDefinition.cs" company="Engage Software">
// Engage: Employment
// Copyright (c) 2004-2010
// by Engage Software ( http://www.engagesoftware.com )
// </copyright>

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED 
// TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL 
// THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF 
// CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER 
// DEALINGS IN THE SOFTWARE.

using System;
using System.Data;
using System.Diagnostics.CodeAnalysis;
using System.Globalization;
using Engage.Dnn.Employment.Data;

namespace Engage.Dnn.Employment
{
    public class ApplicationPropertyDefinition
    {
        [SuppressMessage("Microsoft.Security", "CA2104:DoNotDeclareReadOnlyMutableReferenceTypes", Justification="It actually is immutable")]
        public static readonly ApplicationPropertyDefinition Lead = new ApplicationPropertyDefinition("Lead");

        private int? _id;// = null;
        private int _dataType;
        private string _defaultValue;
		private string _name;
        private bool _required;
        private int _viewOrder;
        private bool _visible;

        private ApplicationPropertyDefinition(string name)
		{
            this._name = name;
		}

        [SuppressMessage("Microsoft.Design", "CA1024:UsePropertiesWhereAppropriate", Justification = "Not a simple/cheap operation")]
        public int GetId()
        {
            InitializeObject();
            return _id ?? -1;
        }

        [SuppressMessage("Microsoft.Design", "CA1024:UsePropertiesWhereAppropriate", Justification = "Not a simple/cheap operation")]
        public int GetDataType()
        {
            InitializeObject();
            return _dataType;
        }

        [SuppressMessage("Microsoft.Design", "CA1024:UsePropertiesWhereAppropriate", Justification = "Not a simple/cheap operation")]
        public string GetDefaultValue()
        {
            InitializeObject();
            return _defaultValue;
        }

        [SuppressMessage("Microsoft.Design", "CA1024:UsePropertiesWhereAppropriate", Justification = "Not a simple/cheap operation")]
        public string GetName()
        {
            InitializeObject();
            return _name;
        }

        [SuppressMessage("Microsoft.Design", "CA1024:UsePropertiesWhereAppropriate", Justification = "Not a simple/cheap operation")]
        public bool GetRequired()
        {
            InitializeObject();
            return _required;
        }

        [SuppressMessage("Microsoft.Design", "CA1024:UsePropertiesWhereAppropriate", Justification = "Not a simple/cheap operation")]
        public int GetViewOrder()
        {
            InitializeObject();
            return _viewOrder;
        }

        [SuppressMessage("Microsoft.Design", "CA1024:UsePropertiesWhereAppropriate", Justification = "Not a simple/cheap operation")]
        public bool GetVisible()
        {
            InitializeObject();
            return _visible;
        }

        private void InitializeObject()
        {
            if (!_id.HasValue)
            {
                using (IDataReader dr = DataProvider.Instance().GetApplicationProperty(this._name, null))
                {
                    if (dr.Read())
                    {
                        _id = Convert.ToInt32(dr["ApplicationPropertyId"], CultureInfo.InvariantCulture);
                        _dataType = Convert.ToInt32(dr["DataType"], CultureInfo.InvariantCulture);
                        _defaultValue = Convert.ToString(dr["DefaultValue"], CultureInfo.InvariantCulture);
                        _name = Convert.ToString(dr["PropertyName"], CultureInfo.InvariantCulture);
                        _required = Convert.ToBoolean(dr["Required"], CultureInfo.InvariantCulture);
                        _viewOrder = Convert.ToInt32(dr["ViewOrder"], CultureInfo.InvariantCulture);
                        _visible = Convert.ToBoolean(dr["Visible"], CultureInfo.InvariantCulture);
                    }
                }
            }
        }
	}
}

